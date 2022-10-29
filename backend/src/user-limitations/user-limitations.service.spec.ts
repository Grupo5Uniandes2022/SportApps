import { Test, TestingModule } from '@nestjs/testing';
import { User } from '../auth/entities/user.entity';
import { UserLimitationsService } from './user-limitations.service';
import { getRepositoryToken } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { UserLimitation } from './entities/user-limitation.entity';

describe('UserLimitationsService', () => {
  let service: UserLimitationsService;
  let userRepository: Repository<User>;
  const USER_REPOSITORY_TOKEN = getRepositoryToken(User);
  let userLimitationsRepository: Repository<UserLimitation>;
  const USER_LIMITATIONS_REPOSITORY_TOKEN = getRepositoryToken(UserLimitation);

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [
        UserLimitationsService,
        {
          provide: USER_REPOSITORY_TOKEN,
          useValue: {
            save: jest.fn(),
            findOneBy: jest.fn()
          } 
        },
        {
          provide: USER_LIMITATIONS_REPOSITORY_TOKEN,
          useValue: {
            save: jest.fn(),
            create: jest.fn()
          } 
        },
      ],
    }).compile();

    service = module.get<UserLimitationsService>(UserLimitationsService);
    userRepository =  module.get<Repository<User>>(USER_REPOSITORY_TOKEN);
    userLimitationsRepository =  module.get<Repository<UserLimitation>>(USER_LIMITATIONS_REPOSITORY_TOKEN);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });

  it('should add user limitations to user', () => {
    const userSpy = jest.spyOn(userRepository,'findOneBy').mockResolvedValue({
      id: '1', email: 'test', password: 'sdadas', fullName: 'test', isActive: true, roles: [], pay: {id:'test', title:'test plan',features: ["te1"], users: []},userLimitation:null
    });
    const userLimitSpy = jest.spyOn(userLimitationsRepository,'create').mockReturnValue({
      id:'2',alimentationType: 'test', alergies: [], foodIntolerances:[]
    });
    const userRepoSpy = jest.spyOn(userRepository,'save').mockResolvedValue({ id: '1', email: 'test', password: 'sdadas', fullName: 'test', isActive: true, roles: [], pay: {id:'test', title:'test plan',features: ["te1"], users: []}, userLimitation: { id:'2',alimentationType: 'test', alergies: [], foodIntolerances:[]}});
    expect(userRepoSpy).toHaveBeenCalledWith({ id: '1', email: 'test', password: 'sdadas', fullName: 'test', isActive: true, roles: [], pay: {id:'test', title:'test plan',features: ["te1"], users: []}, userLimitation: { id:'2',alimentationType: 'test', alergies: [], foodIntolerances:[]}})

  })
});
