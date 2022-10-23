import { Pay } from '../../pay/entities/pay.entity';
import {Entity, PrimaryGeneratedColumn, Column, BeforeInsert, BeforeUpdate, OneToMany, ManyToOne} from 'typeorm';


@Entity('users')
export class User {
  
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column('text', {
    unique: true
  })
  email: string;
  
  @Column('text',{
    select: false
  })
  password: string;
  
  @Column('text')
  fullName: string;
  
  @Column('bool',{
    default: true
  })
  isActive: boolean;

  @Column('text', {
    array: true,
    default: ['user']
  })
  roles: string[];

  @ManyToOne(()=> Pay, (pay) => pay.users)
  pay: Pay


}
