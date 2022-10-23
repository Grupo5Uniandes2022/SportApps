import { JwtStrategy } from "./jwt.strategy";
import { Test, TestingModule } from '@nestjs/testing';
import { Repository } from "typeorm";
import { User } from "../entities/user.entity";
import { getRepositoryToken } from "@nestjs/typeorm";
import { ConfigService } from "@nestjs/config";
import { UnauthorizedException } from '@nestjs/common';

describe('should validate jwt strategy', () => {
  let userRepository: Repository<User>;
  const USER_REPOSITORY_TOKEN = getRepositoryToken(User);
  let configService: ConfigService;

  beforeEach(async ()=>{
    const module: TestingModule = await Test.createTestingModule({
      controllers: [],
      providers: [
        {
          provide: USER_REPOSITORY_TOKEN,
          useValue: {
            create: jest.fn(),
            save: jest.fn(),
            findOne: jest.fn(),
            findOneBy: jest.fn()
          } 
        },
        {
          provide: ConfigService,
          useValue: {
            get: jest.fn()
          }
        }
      ],
    })
    .compile();
    userRepository =  module.get<Repository<User>>(USER_REPOSITORY_TOKEN);
    configService = module.get<ConfigService>(ConfigService);
  })
  
  it('should validate', () => {
    jest.spyOn(configService,'get').mockReturnValue('testjwt');
    jest.spyOn(userRepository,'findOneBy').mockResolvedValue({
      id: '1', email: 'test', password: 'sdadas', fullName: 'test', isActive: true, roles: []
    });
    let strategy: JwtStrategy = new JwtStrategy(userRepository, configService);
    expect(strategy).toBeDefined();
    const user = strategy.validate({id:'1'});
    expect(user).toBeDefined();
  });
  it('should handle no active', async () => {
    jest.spyOn(configService,'get').mockReturnValue('testjwt');
    jest.spyOn(userRepository,'findOneBy').mockResolvedValue({
      id: '1', email: 'test', password: 'sdadas', fullName: 'test', isActive: false, roles: []
    });
    let strategy: JwtStrategy = new JwtStrategy(userRepository, configService);
    expect(strategy).toBeDefined();
    try {
      const user = await strategy.validate({id:'1'});
    } catch (error) {
      expect(error.message).toBe('User is inactive, talk with an admin');
    }
  });
  it('should handle no user', async () => {
    jest.spyOn(configService,'get').mockReturnValue('testjwt');
    let strategy: JwtStrategy = new JwtStrategy(userRepository, configService);
    expect(strategy).toBeDefined();
    try {
      const user = await strategy.validate({id:'1'});
    } catch (error) {
      expect(error.message).toBe('Token not valid');
    }
  });
})