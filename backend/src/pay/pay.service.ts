import { Injectable, ConflictException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { CreatePayDto } from './dto/create-pay.dto';
import { Pay } from './entities/pay.entity';

@Injectable()
export class PayService {
  constructor(
    @InjectRepository(Pay)
    private readonly payRepository: Repository<Pay>,
  ) {}

  async findAll() {
    return await this.payRepository.find({});
  }

  async create(createPayDto: CreatePayDto) {
    try {
      const newPay = await this.payRepository.create(createPayDto);
      await this.payRepository.save(newPay);
      return { ok: true };
    } catch (error) {
      throw new ConflictException(error.detail);
    }
  }
}
