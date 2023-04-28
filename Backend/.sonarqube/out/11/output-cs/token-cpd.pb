è
bC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.WokerService\AppConfiguaration.cs
	namespace 	
Web
 
. 
WokerService 
{ 
public 

static 
class 
AppConfiguaration )
{ 
public 
static 
void 
ConfigServices )
() *
this* .
IServiceCollection/ A
servicesB J
,J K
IConfigurationL Z
configuration[ h
)h i
{ 	
services 
. 
	Configure 
< 
PostgresSettings /
>/ 0
(0 1
configuration1 >
.> ?

GetSection? I
(I J
PostgresSettingsJ Z
.Z [
CONFIG_NAME[ f
)f g
)g h
;h i
services 
. 
	Configure 
< 
GHNSettings *
>* +
(+ ,
configuration, 9
.9 :

GetSection: D
(D E
GHNSettingsE P
.P Q
CONFIG_NAMEQ \
)\ ]
)] ^
;^ _
services 
. 
	Configure 
< 
QueueSettings ,
>, -
(- .
configuration. ;
.; <

GetSection< F
(F G
QueueSettingsG T
.T U
CONFIG_NAMEU `
)` a
)a b
;b c
services 
. 
	Configure 
< 
AppSettings *
>* +
(+ ,
configuration, 9
.9 :

GetSection: D
(D E
AppSettingsE P
.P Q
CONFIG_NAMEQ \
)\ ]
)] ^
;^ _
services 
. 
	Configure 
< 
StorageSettings .
>. /
(/ 0
configuration0 =
.= >

GetSection> H
(H I
StorageSettingsI X
.X Y
CONFIG_NAMEY d
)d e
)e f
;f g
services   
.   &
AddStackExchangeRedisCache   /
(  / 0
options  0 7
=>  8 :
{!! 
options"" 
."" 
Configuration"" %
=""& '
configuration""( 5
.""5 6

GetSection""6 @
(""@ A
$str""A N
)""N O
[""O P
$str""P b
]""b c
;""c d
}## 
)## 
;## 
services&& 
.''  
AddDataInfastructure'' %
(''% &
configuration''& 3
)''3 4
.(( 
AddAppCoreService(( "
(((" #
)((# $
.))  
AddRedisCahedService)) %
())% &
)))& '
.** %
AddDataServiceWebStockets** *
(*** +
)**+ ,
.++ "
AddMessageQueueService++ '
(++' (
)++( )
.,, &
AddStorageServiceExtension,, +
(,,+ ,
configuration,,, 9
),,9 :
;,,: ;
services// 
.// 
AddHostedService// %
<//% &
OrderWorker//& 1
>//1 2
(//2 3
)//3 4
;//4 5
services00 
.00 
AddHostedService00 %
<00% &
InsertOrderWorker00& 7
>007 8
(008 9
)009 :
;00: ;
}11 	
}22 
}33 †
XC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.WokerService\Program.cs
	namespace

 	
Web


 
.

 
WokerService

 
{ 
public 

class 
Program 
{ 
public 
static 
void 
Main 
(  
string  &
[& '
]' (
args) -
)- .
{ 	
CreateHostBuilder 
( 
args "
)" #
.# $
Build$ )
() *
)* +
.+ ,
Run, /
(/ 0
)0 1
;1 2
} 	
public 
static 
IHostBuilder "
CreateHostBuilder# 4
(4 5
string5 ;
[; <
]< =
args> B
)B C
=>D F
Host 
.  
CreateDefaultBuilder %
(% &
args& *
)* +
. 
ConfigAppSettings "
(" #
)# $
. 
ConfigureServices "
(" #
(# $
hostContext$ /
,/ 0
services1 9
)9 :
=>; =
{ 
var 
config 
=  
hostContext! ,
., -
Configuration- :
;: ;
AppConfiguaration %
.% &
ConfigServices& 4
(4 5
services5 =
,= >
config? E
)E F
;F G
} 
) 
. %
UseServiceProviderFactory ,
(, -
new- 0)
AutofacServiceProviderFactory1 N
(N O
)O P
)P Q
;Q R
} 
} ¸

iC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.WokerService\Worker\InsertOrderWorker.cs
	namespace 	
Web
 
. 
WokerService 
{ 
public 

class 
InsertOrderWorker "
:# $
BackgroundService% 6
{ 
private 
readonly 
IConsumerQueue '
	_consumer( 1
;1 2
private 
readonly 
IOrderService &
_orderService' 4
;4 5
public 
InsertOrderWorker  
(  !
IConsumerQueue! /
consumer0 8
,8 9
IOrderService: G
orderServiceH T
)T U
{ 	
	_consumer 
= 
consumer  
;  !
_orderService 
= 
orderService (
;( )
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken3 D
stoppingTokenE R
)R S
{ 	
await 
	_consumer 
. 
StartConsumeAsync -
(- .
_orderService. ;
.; <#
InsertOrderOnQueueAsync< S
)S T
;T U
} 	
} 
} Í

cC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.WokerService\Worker\OrderWorker.cs
	namespace 	
Web
 
. 
WokerService 
{ 
public 

class 
OrderWorker 
: 
BackgroundService 0
{ 
private 
readonly 
IConsumerQueue '
	_consumer( 1
;1 2
private 
readonly 
IOrderService &
_orderService' 4
;4 5
public 
OrderWorker 
( 
IConsumerQueue )
consumer* 2
,2 3
IOrderService4 A
orderServiceB N
)N O
{ 	
	_consumer 
= 
consumer  
;  !
_orderService 
= 
orderService (
;( )
} 	
	protected 
override 
async  
Task! %
ExecuteAsync& 2
(2 3
CancellationToken3 D
stoppingTokenE R
)R S
{ 	
await 
	_consumer 
. 
StartConsumeAsync -
(- .
_orderService. ;
.; <#
UpdateOrderOnQueueAsync< S
)S T
;T U
} 	
} 
} 