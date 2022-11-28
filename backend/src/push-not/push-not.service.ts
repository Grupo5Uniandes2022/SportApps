import { Injectable } from '@nestjs/common';
import { CreatePushNotDto } from './dto/create-push-not.dto';
import { UpdatePushNotDto } from './dto/update-push-not.dto';

@Injectable()
export class PushNotService {
  create(createPushNotDto: CreatePushNotDto) {
    return 'This action adds a new pushNot';
  }

  findAll() {
    return `This action returns all pushNot`;
  }

  findOne(id: number) {
    return `This action returns a #${id} pushNot`;
  }

  update(id: number, updatePushNotDto: UpdatePushNotDto) {
    return `This action updates a #${id} pushNot`;
  }

  remove(id: number) {
    return `This action removes a #${id} pushNot`;
  }
}
