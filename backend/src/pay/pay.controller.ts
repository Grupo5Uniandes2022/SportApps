import { Controller, Get, Post, Body } from '@nestjs/common';
import { PayService } from './pay.service';
import { CreatePayDto } from './dto/create-pay.dto';

@Controller('pay')
export class PayController {
  constructor(private readonly payService: PayService) {}

  @Post()
  create(@Body() createPayDto: CreatePayDto) {
    return this.payService.create(createPayDto);
  }

  @Get()
  findAll() {
    return this.payService.findAll();
  }
}
