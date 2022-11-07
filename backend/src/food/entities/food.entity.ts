import { User } from '../../auth/entities/user.entity';
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from 'typeorm';

@Entity('food')
export class Food {
  @PrimaryGeneratedColumn('uuid')
  id: string;

  @Column('bool', {
    default: false,
  })
  isLimitation: boolean;

  @Column('bool', {
    default: false,
  })
  isIntolerance: boolean;

  @Column('text')
  description: string;

  @ManyToOne(() => User, (user) => user.foods)
  user: User;
}
