import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { PushNotService } from './push-not.service';
import { CreatePushNotDto } from './dto/create-push-not.dto';
import { UpdatePushNotDto } from './dto/update-push-not.dto';

@Controller('push-not')
export class PushNotController {
  constructor(private readonly pushNotService: PushNotService) {}

  @Post()
  create(@Body() createPushNotDto: CreatePushNotDto) {
    return this.pushNotService.create(createPushNotDto);
  }

  @Get()
  findAll() {
    return this.pushNotService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.pushNotService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updatePushNotDto: UpdatePushNotDto) {
    return this.pushNotService.update(+id, updatePushNotDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.pushNotService.remove(+id);
  }
}
