# Graph Report - .  (2026-05-28)

## Corpus Check
- Corpus is ~27,613 words - fits in a single context window. You may not need a graph.

## Summary
- 803 nodes · 758 edges · 123 communities detected
- Extraction: 100% EXTRACTED · 0% INFERRED · 0% AMBIGUOUS
- Token cost: 0 input · 0 output
- Edge kinds: method: 289 · contains: 206 · imports_from: 194 · calls: 57 · imports: 12


## Input Scope
- Requested: all
- Resolved: all (source: cli)
- Included files: 384 · Candidates: recursive
- Excluded: 0 untracked · 0 ignored · 38 sensitive · 0 missing committed

## Graph Freshness
- Built from Git commit: `5ea36d0`
- Compare this hash to `git rev-parse HEAD` before trusting freshness-sensitive graph output.
## God Nodes (most connected - your core abstractions)
1. `UserValidator` - 19 edges
2. `AuthService` - 13 edges
3. `RoleValidator` - 13 edges
4. `UserService` - 12 edges
5. `AbstractFormComponent` - 12 edges
6. `FormComponent` - 11 edges
7. `RoleService` - 10 edges
8. `AuthService` - 9 edges
9. `PaginationComponent` - 9 edges
10. `ListView` - 9 edges

## Surprising Connections (you probably didn't know these)
- None detected - all connections are within the same source files.

## Communities

### Community 0 - "Community 0"
Cohesion: 0.06
Nodes (14): AccountEntity, SessionEntity, JwtGuard, Account, Findable, Multimedia, Role, Session (+6 more)

### Community 1 - "Community 1"
Cohesion: 0.06
Nodes (5): Register, JwtUtils, AuthService, JwtStrategy, RefreshStrategy

### Community 2 - "Community 2"
Cohesion: 0.08
Nodes (5): CreateVideoDto, UpdateVideoDto, VideoEntity, VideoValidator, VideoController

### Community 3 - "Community 3"
Cohesion: 0.09
Nodes (5): appRoutes, CallbackComponent, LoginComponent, LogoutComponent, VideoService

### Community 4 - "Community 4"
Cohesion: 0.18
Nodes (1): UserValidator

### Community 5 - "Community 5"
Cohesion: 0.13
Nodes (6): AuthWebappUiModule, SecurityWebappUiModule, ListComponent, UserModule, userRoutes, videoRoutes

### Community 6 - "Community 6"
Cohesion: 0.18
Nodes (3): MainWebappUiModule, SecurityWebappCoreModule, SharedWebappUiModule

### Community 7 - "Community 7"
Cohesion: 0.15
Nodes (4): AuthResponse, RoleEntity, UserEntity, JwtPayload

### Community 8 - "Community 8"
Cohesion: 0.24
Nodes (1): RoleValidator

### Community 9 - "Community 9"
Cohesion: 0.18
Nodes (3): AsideComponent, ICONS, ToastComponent

### Community 10 - "Community 10"
Cohesion: 0.18
Nodes (1): UserService

### Community 11 - "Community 11"
Cohesion: 0.24
Nodes (1): AbstractFormComponent

### Community 12 - "Community 12"
Cohesion: 0.20
Nodes (2): AppModule, VideoModule

### Community 13 - "Community 13"
Cohesion: 0.20
Nodes (1): FormComponent

### Community 14 - "Community 14"
Cohesion: 0.24
Nodes (3): Config, ConfigService, ConfigWebappCoreModule

### Community 15 - "Community 15"
Cohesion: 0.27
Nodes (1): PaginationComponent

### Community 16 - "Community 16"
Cohesion: 0.20
Nodes (1): ListView

### Community 17 - "Community 17"
Cohesion: 0.24
Nodes (1): RoleService

### Community 18 - "Community 18"
Cohesion: 0.28
Nodes (1): AuthService

### Community 19 - "Community 19"
Cohesion: 0.22
Nodes (4): BYPASS_CONTENT_TYPE, BYPASS_JWT_TOKEN, JwtInterceptor, KS_HTTP_INTERCEPTOR

### Community 20 - "Community 20"
Cohesion: 0.31
Nodes (4): emptyToast, Toast, ToastService, ToastType

### Community 21 - "Community 21"
Cohesion: 0.22
Nodes (2): BaseService, Options

### Community 22 - "Community 22"
Cohesion: 0.25
Nodes (1): VideoService

### Community 23 - "Community 23"
Cohesion: 0.25
Nodes (1): AuthController

### Community 24 - "Community 24"
Cohesion: 0.25
Nodes (1): RoleController

### Community 25 - "Community 25"
Cohesion: 0.25
Nodes (1): UserController

### Community 26 - "Community 26"
Cohesion: 0.29
Nodes (1): AbstractListComponent

### Community 27 - "Community 27"
Cohesion: 0.29
Nodes (2): AuthenticationService, SCOPES

### Community 28 - "Community 28"
Cohesion: 0.33
Nodes (2): SCOPES, YoutubeService

### Community 29 - "Community 29"
Cohesion: 0.48
Nodes (1): SessionService

### Community 30 - "Community 30"
Cohesion: 0.33
Nodes (2): AuthApiModule, SecurityApiModule

### Community 31 - "Community 31"
Cohesion: 0.47
Nodes (3): ConfigApiModule, configuration(), validationSchema

### Community 32 - "Community 32"
Cohesion: 0.47
Nodes (1): NotificationComponent

### Community 33 - "Community 33"
Cohesion: 0.40
Nodes (2): GoogleStrategy, SCOPES

### Community 34 - "Community 34"
Cohesion: 0.33
Nodes (1): YoutubeController

### Community 35 - "Community 35"
Cohesion: 0.40
Nodes (1): AccountService

### Community 36 - "Community 36"
Cohesion: 0.40
Nodes (1): AuthenticationController

### Community 37 - "Community 37"
Cohesion: 0.40
Nodes (2): BreadcrumbComponent, MenuItem

### Community 38 - "Community 38"
Cohesion: 0.50
Nodes (1): BaseService

### Community 39 - "Community 39"
Cohesion: 0.40
Nodes (1): ModalService

### Community 40 - "Community 40"
Cohesion: 0.50
Nodes (1): MailSenderService

### Community 41 - "Community 41"
Cohesion: 0.40
Nodes (1): UserService

### Community 42 - "Community 42"
Cohesion: 0.67
Nodes (1): AbstractDetailComponent

### Community 43 - "Community 43"
Cohesion: 0.50
Nodes (1): AccountController

### Community 44 - "Community 44"
Cohesion: 0.50
Nodes (1): AppController

### Community 45 - "Community 45"
Cohesion: 0.50
Nodes (1): ContentDirective

### Community 46 - "Community 46"
Cohesion: 0.50
Nodes (2): IMetadataVideo, MetadataVideo

### Community 47 - "Community 47"
Cohesion: 0.50
Nodes (1): AdminGuard

### Community 48 - "Community 48"
Cohesion: 0.50
Nodes (1): AuthChildGuard

### Community 49 - "Community 49"
Cohesion: 0.50
Nodes (1): AuthGuard

### Community 50 - "Community 50"
Cohesion: 0.50
Nodes (1): HeaderComponent

### Community 51 - "Community 51"
Cohesion: 0.50
Nodes (1): mainWebappUiRoutes

### Community 52 - "Community 52"
Cohesion: 0.50
Nodes (1): LocalStrategy

### Community 53 - "Community 53"
Cohesion: 0.50
Nodes (1): ModalComponent

### Community 54 - "Community 54"
Cohesion: 0.50
Nodes (1): MainComponent

### Community 55 - "Community 55"
Cohesion: 0.50
Nodes (1): LoadingService

### Community 56 - "Community 56"
Cohesion: 0.50
Nodes (1): MailSenderController

### Community 57 - "Community 57"
Cohesion: 0.50
Nodes (1): AuthValidator

### Community 58 - "Community 58"
Cohesion: 0.67
Nodes (2): compiled, fixture

### Community 59 - "Community 59"
Cohesion: 0.67
Nodes (1): AppService

### Community 60 - "Community 60"
Cohesion: 0.67
Nodes (1): Chainable

### Community 61 - "Community 61"
Cohesion: 1.00
Nodes (1): environment

### Community 62 - "Community 62"
Cohesion: 0.67
Nodes (2): { createGlobPatternsForDependencies }, { join }

### Community 63 - "Community 63"
Cohesion: 0.67
Nodes (1): DetailComponent

### Community 64 - "Community 64"
Cohesion: 0.67
Nodes (1): CreateGoogleUserDto

### Community 65 - "Community 65"
Cohesion: 0.67
Nodes (1): CreateRoleDto

### Community 66 - "Community 66"
Cohesion: 0.67
Nodes (1): CreateUserDto

### Community 67 - "Community 67"
Cohesion: 0.67
Nodes (1): UpdateRoleDto

### Community 68 - "Community 68"
Cohesion: 0.67
Nodes (1): UpdateUserDto

### Community 69 - "Community 69"
Cohesion: 0.67
Nodes (1): UserDto

### Community 70 - "Community 70"
Cohesion: 0.67
Nodes (1): FormView

### Community 71 - "Community 71"
Cohesion: 0.67
Nodes (1): AuthWebappCoreModule

### Community 72 - "Community 72"
Cohesion: 0.67
Nodes (1): LoadingComponent

### Community 73 - "Community 73"
Cohesion: 0.67
Nodes (1): AsideService

### Community 74 - "Community 74"
Cohesion: 0.67
Nodes (1): VideoComponent

### Community 75 - "Community 75"
Cohesion: 0.67
Nodes (1): DataResolver

### Community 76 - "Community 76"
Cohesion: 1.00
Nodes (1): { composePlugins, withNx }

### Community 77 - "Community 77"
Cohesion: 1.00
Nodes (1): AppComponent

### Community 78 - "Community 78"
Cohesion: 1.00
Nodes (1): appController

### Community 81 - "Community 81"
Cohesion: 1.00
Nodes (1): environment

### Community 82 - "Community 82"
Cohesion: 1.00
Nodes (1): CommonModule

### Community 83 - "Community 83"
Cohesion: 1.00
Nodes (1): Auditable

### Community 84 - "Community 84"
Cohesion: 1.00
Nodes (1): BaseDataBase

### Community 85 - "Community 85"
Cohesion: 1.00
Nodes (1): HasId

### Community 87 - "Community 87"
Cohesion: 1.00
Nodes (1): DetailView

### Community 88 - "Community 88"
Cohesion: 1.00
Nodes (1): directive

### Community 89 - "Community 89"
Cohesion: 1.00
Nodes (1): LoginDto

### Community 90 - "Community 90"
Cohesion: 1.00
Nodes (1): RefreshResponse

### Community 91 - "Community 91"
Cohesion: 1.00
Nodes (1): SendMailerDto

### Community 92 - "Community 92"
Cohesion: 1.00
Nodes (1): UploadVideoResponse

### Community 93 - "Community 93"
Cohesion: 1.00
Nodes (1): FooterComponent

### Community 94 - "Community 94"
Cohesion: 1.00
Nodes (1): GoogleGuard

### Community 95 - "Community 95"
Cohesion: 1.00
Nodes (1): LocalGuard

### Community 96 - "Community 96"
Cohesion: 1.00
Nodes (1): RefreshGuard

### Community 97 - "Community 97"
Cohesion: 1.00
Nodes (1): Createable

### Community 98 - "Community 98"
Cohesion: 1.00
Nodes (1): Deletable

### Community 99 - "Community 99"
Cohesion: 1.00
Nodes (1): Serviceable

### Community 100 - "Community 100"
Cohesion: 1.00
Nodes (1): Updatable

### Community 101 - "Community 101"
Cohesion: 1.00
Nodes (1): Video

### Community 103 - "Community 103"
Cohesion: 1.00
Nodes (1): AuthWebappUiComponent

### Community 104 - "Community 104"
Cohesion: 1.00
Nodes (1): authWebappUiRoutes

### Community 105 - "Community 105"
Cohesion: 1.00
Nodes (1): CoreApiModule

### Community 106 - "Community 106"
Cohesion: 1.00
Nodes (1): GcloudApiModule

### Community 107 - "Community 107"
Cohesion: 1.00
Nodes (1): LayoutWebappCoreModule

### Community 108 - "Community 108"
Cohesion: 1.00
Nodes (1): LayoutWebappUiModule

### Community 109 - "Community 109"
Cohesion: 1.00
Nodes (1): MainWebappUiComponent

### Community 110 - "Community 110"
Cohesion: 1.00
Nodes (1): MultimediaApiModule

### Community 111 - "Community 111"
Cohesion: 1.00
Nodes (1): MultimediaWebappCoreModule

### Community 112 - "Community 112"
Cohesion: 1.00
Nodes (1): MultimediaWebappUiModule

### Community 113 - "Community 113"
Cohesion: 1.00
Nodes (1): multimediaWebappUiRoutes

### Community 114 - "Community 114"
Cohesion: 1.00
Nodes (1): securityWebappUiRoutes

### Community 115 - "Community 115"
Cohesion: 1.00
Nodes (1): SharedApiModule

### Community 116 - "Community 116"
Cohesion: 1.00
Nodes (1): SharedWebappCoreModule

### Community 117 - "Community 117"
Cohesion: 1.00
Nodes (1): RegisterComponent

### Community 118 - "Community 118"
Cohesion: 1.00
Nodes (1): MenuComponent

### Community 119 - "Community 119"
Cohesion: 1.00
Nodes (1): SVG

### Community 120 - "Community 120"
Cohesion: 1.00
Nodes (1): SecurityComponent

### Community 121 - "Community 121"
Cohesion: 1.00
Nodes (1): Menu

### Community 122 - "Community 122"
Cohesion: 1.00
Nodes (1): MenuItem

### Community 123 - "Community 123"
Cohesion: 1.00
Nodes (1): DataTableType

### Community 124 - "Community 124"
Cohesion: 1.00
Nodes (1): MailSenderModule

### Community 125 - "Community 125"
Cohesion: 1.00
Nodes (1): UserComponent

### Community 126 - "Community 126"
Cohesion: 1.00
Nodes (1): Order

## Knowledge Gaps
- **92 isolated node(s):** `appController`, `{ composePlugins, withNx }`, `fixture`, `compiled`, `AppComponent` (+87 more)
  These have ≤1 connection - possible missing edges or undocumented components.
- **Thin community `Community 4`** (1 nodes): `UserValidator`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 8`** (1 nodes): `RoleValidator`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 10`** (1 nodes): `UserService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 11`** (1 nodes): `AbstractFormComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 12`** (2 nodes): `AppModule`, `VideoModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 13`** (1 nodes): `FormComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 15`** (1 nodes): `PaginationComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 16`** (1 nodes): `ListView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 17`** (1 nodes): `RoleService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 18`** (1 nodes): `AuthService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 21`** (2 nodes): `BaseService`, `Options`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 22`** (1 nodes): `VideoService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 23`** (1 nodes): `AuthController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 24`** (1 nodes): `RoleController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 25`** (1 nodes): `UserController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 26`** (1 nodes): `AbstractListComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 27`** (2 nodes): `AuthenticationService`, `SCOPES`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 28`** (2 nodes): `SCOPES`, `YoutubeService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 29`** (1 nodes): `SessionService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 30`** (2 nodes): `AuthApiModule`, `SecurityApiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 32`** (1 nodes): `NotificationComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 33`** (2 nodes): `GoogleStrategy`, `SCOPES`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 34`** (1 nodes): `YoutubeController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 35`** (1 nodes): `AccountService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 36`** (1 nodes): `AuthenticationController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 37`** (2 nodes): `BreadcrumbComponent`, `MenuItem`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 38`** (1 nodes): `BaseService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 39`** (1 nodes): `ModalService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 40`** (1 nodes): `MailSenderService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 41`** (1 nodes): `UserService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 42`** (1 nodes): `AbstractDetailComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 43`** (1 nodes): `AccountController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 44`** (1 nodes): `AppController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 45`** (1 nodes): `ContentDirective`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 46`** (2 nodes): `IMetadataVideo`, `MetadataVideo`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 47`** (1 nodes): `AdminGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 48`** (1 nodes): `AuthChildGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 49`** (1 nodes): `AuthGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 50`** (1 nodes): `HeaderComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 51`** (1 nodes): `mainWebappUiRoutes`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 52`** (1 nodes): `LocalStrategy`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 53`** (1 nodes): `ModalComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 54`** (1 nodes): `MainComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 55`** (1 nodes): `LoadingService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 56`** (1 nodes): `MailSenderController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 57`** (1 nodes): `AuthValidator`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 58`** (2 nodes): `compiled`, `fixture`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 59`** (1 nodes): `AppService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 60`** (1 nodes): `Chainable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 61`** (1 nodes): `environment`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 62`** (2 nodes): `{ createGlobPatternsForDependencies }`, `{ join }`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 63`** (1 nodes): `DetailComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 64`** (1 nodes): `CreateGoogleUserDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 65`** (1 nodes): `CreateRoleDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 66`** (1 nodes): `CreateUserDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 67`** (1 nodes): `UpdateRoleDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 68`** (1 nodes): `UpdateUserDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 69`** (1 nodes): `UserDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 70`** (1 nodes): `FormView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 71`** (1 nodes): `AuthWebappCoreModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 72`** (1 nodes): `LoadingComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 73`** (1 nodes): `AsideService`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 74`** (1 nodes): `VideoComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 75`** (1 nodes): `DataResolver`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 76`** (1 nodes): `{ composePlugins, withNx }`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 77`** (1 nodes): `AppComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 78`** (1 nodes): `appController`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 81`** (1 nodes): `environment`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 82`** (1 nodes): `CommonModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 83`** (1 nodes): `Auditable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 84`** (1 nodes): `BaseDataBase`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 85`** (1 nodes): `HasId`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 87`** (1 nodes): `DetailView`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 88`** (1 nodes): `directive`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 89`** (1 nodes): `LoginDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 90`** (1 nodes): `RefreshResponse`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 91`** (1 nodes): `SendMailerDto`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 92`** (1 nodes): `UploadVideoResponse`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 93`** (1 nodes): `FooterComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 94`** (1 nodes): `GoogleGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 95`** (1 nodes): `LocalGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 96`** (1 nodes): `RefreshGuard`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 97`** (1 nodes): `Createable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 98`** (1 nodes): `Deletable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 99`** (1 nodes): `Serviceable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 100`** (1 nodes): `Updatable`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 101`** (1 nodes): `Video`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 103`** (1 nodes): `AuthWebappUiComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 104`** (1 nodes): `authWebappUiRoutes`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 105`** (1 nodes): `CoreApiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 106`** (1 nodes): `GcloudApiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 107`** (1 nodes): `LayoutWebappCoreModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 108`** (1 nodes): `LayoutWebappUiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 109`** (1 nodes): `MainWebappUiComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 110`** (1 nodes): `MultimediaApiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 111`** (1 nodes): `MultimediaWebappCoreModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 112`** (1 nodes): `MultimediaWebappUiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 113`** (1 nodes): `multimediaWebappUiRoutes`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 114`** (1 nodes): `securityWebappUiRoutes`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 115`** (1 nodes): `SharedApiModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 116`** (1 nodes): `SharedWebappCoreModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 117`** (1 nodes): `RegisterComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 118`** (1 nodes): `MenuComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 119`** (1 nodes): `SVG`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 120`** (1 nodes): `SecurityComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 121`** (1 nodes): `Menu`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 122`** (1 nodes): `MenuItem`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 123`** (1 nodes): `DataTableType`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 124`** (1 nodes): `MailSenderModule`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 125`** (1 nodes): `UserComponent`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.
- **Thin community `Community 126`** (1 nodes): `Order`
  Too small to be a meaningful cluster - may be noise or needs more connections extracted.

## Suggested Questions
_Questions this graph is uniquely positioned to answer:_

- **What connects `appController`, `{ composePlugins, withNx }`, `fixture` to the rest of the system?**
  _92 weakly-connected nodes found - possible documentation gaps or missing edges._
- **Should `Community 0` be split into smaller, more focused modules?**
  _Cohesion score 0.06105457909343201 - nodes in this community are weakly interconnected._
- **Should `Community 1` be split into smaller, more focused modules?**
  _Cohesion score 0.06417112299465241 - nodes in this community are weakly interconnected._
- **Should `Community 2` be split into smaller, more focused modules?**
  _Cohesion score 0.08333333333333333 - nodes in this community are weakly interconnected._
- **Should `Community 3` be split into smaller, more focused modules?**
  _Cohesion score 0.08695652173913043 - nodes in this community are weakly interconnected._
- **Should `Community 5` be split into smaller, more focused modules?**
  _Cohesion score 0.1323529411764706 - nodes in this community are weakly interconnected._