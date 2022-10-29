import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UserLimitationsService } from './user-limitations.service';
import { CreateUserLimitationDto } from './dto/create-user-limitation.dto';
import { Auth, GetUser } from '../auth/decorators';
import { User } from '../auth/entities/user.entity';

@Controller('user-limitations')
export class UserLimitationsController {
  constructor(private readonly userLimitationsService: UserLimitationsService) {}

  @Post()
  @Auth()
  create(@GetUser()user: User, @Body() createUserLimitationDto: CreateUserLimitationDto) {
    return this.userLimitationsService.create(user.id, createUserLimitationDto);
  }
}
