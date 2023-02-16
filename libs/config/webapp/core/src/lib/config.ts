import { DEFAULT_ADMIN_ROLE, DEFAULT_USER_ROLE } from "@kaad/shared/ng-common";

export class Config {

    urlApi = '';
    urlFront = '';
    clientCode = '';

    uriLogin = 'login';
    uriLogout = 'logout';
    uriRenewToken = 'refresh';

    uriRegister = 'register';

    tokenHeaderName = 'access_token';
    refreshTokenHeaderName = 'refresh_token';

    loginPage = '/auth/login';
    logoutPage = '/auth/logout';
    homePage = '/';

    userRole = DEFAULT_USER_ROLE;
    adminRole = DEFAULT_ADMIN_ROLE;
}
