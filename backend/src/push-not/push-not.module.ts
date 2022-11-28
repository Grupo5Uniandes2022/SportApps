import { Module } from '@nestjs/common';
import { PushNotService } from './push-not.service';
import { PushNotController } from './push-not.controller';

@Module({
  controllers: [PushNotController],
  providers: [PushNotService]
})
export class PushNotModule {}
