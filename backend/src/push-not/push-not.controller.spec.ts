import { Test, TestingModule } from '@nestjs/testing';
import { PushNotController } from './push-not.controller';
import { PushNotService } from './push-not.service';

describe('PushNotController', () => {
  let controller: PushNotController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [PushNotController],
      providers: [PushNotService],
    }).compile();

    controller = module.get<PushNotController>(PushNotController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
