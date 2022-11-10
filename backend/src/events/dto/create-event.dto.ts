import { IsDate, IsDateString, IsIn, IsString, IsInt } from "class-validator";

export class CreateEventDto {

  @IsDateString()
  startDate: Date;
  
  @IsDateString()
  endDate: Date;
  
  @IsString()
  title: string;

  @IsIn(['training','group','appointment','free'])
  type: string;

  @IsInt()
  duration: number;

  @IsInt()
  distance: number;

}