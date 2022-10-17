import { Controller, Get, Post, Body, Req, UseGuards, SetMetadata } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';
import { GetUser,RawHeaders, Auth, RoleProtected } from './decorators';
import { LoginUserDto, CreateUserDto } from './dto';
import { User } from './entities/user.entity';
import { UserRoleGuard } from './guards/user-role.guard';
import { ValidRoles } from './interfaces';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('register')
  create(@Body() createUserDto: CreateUserDto) {
    return this.authService.create(createUserDto);
  }
  
  @Post('login')
  loginUser(@Body() loginUserDto: LoginUserDto){
    return this.authService.login(loginUserDto);
  }

  @Get('check-status')
  @Auth()
  checkAuthStatus(
    @GetUser()user: User
  ){
    return this.authService.checkAuthStatus(user)
  }

/* 
  @Get('private')
  @UseGuards(AuthGuard())
  testingPrivateRoute(
    @GetUser('email') user: User,
    @RawHeaders() rawHeaders: string[]
  ){
    return {
      ok: true,
      msg:'private route',
      user,
      rawHeaders 
    }
  }


  @Get('private2')
  @RoleProtected(ValidRoles.superUser)
  @UseGuards(AuthGuard(), UserRoleGuard)
  privateRoute2(
    @GetUser() user: User
  ){
    return {
      ok: true,
      user
    }
  }

  @Get('private3')
  @Auth(ValidRoles.superUser)
  privateRoute3(){
    return {ok:true}
  } */
}
