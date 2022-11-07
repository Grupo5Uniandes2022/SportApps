import { Body, Controller, Get, Param, Post } from '@nestjs/common';
import { CreateFoodDto } from './dto/create-food.dto';
import { FoodService } from './food.service';

@Controller('food')
export class FoodController {
  constructor(private readonly foodService: FoodService) {}

  @Post(':id')
  create(@Body() createFoodDto: CreateFoodDto, @Param() params) {
    return this.foodService.create(createFoodDto, params.id);
  }

  @Get()
  findAll() {
    return this.foodService.findAll();
  }

  @Get(':id')
  findOne(@Param() params) {
    return this.foodService.findOne(params.id);
  }
}
