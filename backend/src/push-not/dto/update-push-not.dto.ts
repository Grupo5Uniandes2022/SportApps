import { PartialType } from '@nestjs/mapped-types';
import { CreatePushNotDto } from './create-push-not.dto';

export class UpdatePushNotDto extends PartialType(CreatePushNotDto) {}
