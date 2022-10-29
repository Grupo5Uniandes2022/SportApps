import { IsDate, IsDateString, IsIn, IsString } from "class-validator";

export class CreateEventDto {

  @IsDateString()
  startDate: Date;
  
  @IsDateString()
  endDate: Date;
  
  @IsString()
  title: string;

  @IsIn(['training','group','appointment'])
  type: string;

}