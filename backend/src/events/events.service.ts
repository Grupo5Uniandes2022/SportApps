import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from '../auth/entities/user.entity';
import { CreateEventDto } from './dto/create-event.dto';
import { Event } from './entities/event.entity';

@Injectable()
export class EventsService {

  constructor(
    @InjectRepository(Event)
    private readonly eventRepository: Repository<Event>,
    
    @InjectRepository(User)
    private readonly userRepository: Repository<User>,
  ) {
    
  }
  async create(user: User, createEventDto: CreateEventDto) {
    const newEvent = await this.eventRepository.create(createEventDto);
    newEvent.user = user;
    await    this.eventRepository.save(newEvent);
    return {ok: true}
  }

  async findAll(user: User) {
    return  await (await this.eventRepository.find({relations:['user']})).filter(event => event.user.id === user.id);

  }

  async setAppointment(user: User, idDoctor: string, createEventDto: CreateEventDto){
    createEventDto.title = `Appointment ${user.fullName}`;
    const newEvent = await this.eventRepository.create(createEventDto)
    const doctor = await this.userRepository.findOneBy({id: idDoctor});
    if(doctor){
      newEvent.user = doctor;
      this.eventRepository.save(newEvent);
      return {ok: true}
    }    
    return {ok: false}
   }
 
}
