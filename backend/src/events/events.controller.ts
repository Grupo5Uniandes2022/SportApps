import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { EventsService } from './events.service';
import { CreateEventDto } from './dto/create-event.dto';
import { Auth, GetUser } from '../auth/decorators';
import { User } from '../auth/entities/user.entity';

@Controller('events')
export class EventsController {
  constructor(private readonly eventsService: EventsService) {}

  @Post()
  @Auth()
  create(@GetUser() user: User, @Body() createEventDto: CreateEventDto) {
    return this.eventsService.create(user, createEventDto);
  }

  @Get()
  @Auth()
  findAll(@GetUser()  user:User) {
    return this.eventsService.findAll(user);
  }

  @Post('/appointment/:id')
  @Auth()
  setAppointment(@GetUser() user: User, @Param('id') idDoctor: string, @Body() createEventDto: CreateEventDto){
    return this.eventsService.setAppointment(user, idDoctor, createEventDto);
  }

}
