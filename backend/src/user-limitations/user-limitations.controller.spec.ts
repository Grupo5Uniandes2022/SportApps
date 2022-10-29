import { Test, TestingModule } from '@nestjs/testing';
import { UserLimitationsController } from './user-limitations.controller';
import { UserLimitationsService } from './user-limitations.service';

describe('UserLimitationsController', () => {
  let controller: UserLimitationsController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [UserLimitationsController],
      providers: [UserLimitationsService],
    }).compile();

    controller = module.get<UserLimitationsController>(UserLimitationsController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
