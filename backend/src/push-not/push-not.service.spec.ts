import { Test, TestingModule } from '@nestjs/testing';
import { PushNotService } from './push-not.service';

describe('PushNotService', () => {
  let service: PushNotService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [PushNotService],
    }).compile();

    service = module.get<PushNotService>(PushNotService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
