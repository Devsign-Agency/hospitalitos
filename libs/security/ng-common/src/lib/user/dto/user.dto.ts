export interface UserDto {
    username: string;
    email: string;
    firstname: string;
    lastname: string;
    photoUrl: string;
    preferences?: string[];
}
