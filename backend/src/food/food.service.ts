import { ConflictException, Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/auth/entities/user.entity';
import { Repository } from 'typeorm';
import { CreateFoodDto } from './dto/create-food.dto';
import { Food } from './entities/food.entity';

@Injectable()
export class FoodService {
  constructor(
    @InjectRepository(Food)
    private readonly foodRepository: Repository<Food>,
    private readonly userRepository: Repository<User>,
  ) {}

  async findAll() {
    return await this.foodRepository.find({});
  }

  async create(createFoodDto: CreateFoodDto, userId: string) {
    try {
      const user = await this.userRepository.findOne({
        where: { id: userId },
      });
      const food = new Food();
      food.isLimitation = createFoodDto.isLimitation;
      food.isIntolerance = createFoodDto.isIntolerance;
      food.description = createFoodDto.description;
      food.user = user;
      await this.foodRepository.save(food);
      return { ok: true };
    } catch (error) {
      throw new ConflictException(error.detail);
    }
  }

  async findOne(foodId: string) {
    return await this.foodRepository.findOne({
      where: { id: foodId },
    });
  }
}
