›
^C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\ConnectionManager.cs
	namespace

 	
Web


 
.

 
Stockets

 
{ 
public 

class 
ConnectionManager "
{ 
private  
ConcurrentDictionary $
<$ %
string% +
,+ ,
	WebSocket- 6
>6 7
_sockets8 @
=A B
newC F 
ConcurrentDictionaryG [
<[ \
string\ b
,b c
	WebSocketd m
>m n
(n o
)o p
;p q
public 
	WebSocket 
GetSocketById &
(& '
string' -
id. 0
)0 1
{ 	
return 
_sockets 
. 
FirstOrDefault *
(* +
p+ ,
=>- /
p0 1
.1 2
Key2 5
==6 8
id9 ;
); <
.< =
Value= B
;B C
} 	
public  
ConcurrentDictionary #
<# $
string$ *
,* +
	WebSocket, 5
>5 6
GetAll7 =
(= >
)> ?
{ 	
return   
_sockets   
;   
}!! 	
public## 
string## 
GetId## 
(## 
	WebSocket## %
socket##& ,
)##, -
{$$ 	
return%% 
_sockets%% 
.%% 
FirstOrDefault%% *
(%%* +
p%%+ ,
=>%%- /
p%%0 1
.%%1 2
Value%%2 7
==%%8 :
socket%%; A
)%%A B
.%%B C
Key%%C F
;%%F G
}&& 	
public'' 
void'' 
	AddSocket'' 
('' 
	WebSocket'' '
socket''( .
)''. /
{(( 	
_sockets)) 
.)) 
TryAdd)) 
()) 
CreateConnectionId)) .
()). /
)))/ 0
,))0 1
socket))2 8
)))8 9
;))9 :
}** 	
public,, 
async,, 
Task,, 
RemoveSocket,, &
(,,& '
string,,' -
id,,. 0
),,0 1
{-- 	
	WebSocket.. 
socket.. 
;.. 
_sockets// 
.// 
	TryRemove// 
(// 
id// !
,//! "
out//# &
socket//' -
)//- .
;//. /
await11 
socket11 
.11 

CloseAsync11 #
(11# $
closeStatus11$ /
:11/ 0 
WebSocketCloseStatus111 E
.11E F
NormalClosure11F S
,11S T
statusDescription22$ 5
:225 6
$str227 X
,22X Y
cancellationToken33$ 5
:335 6
CancellationToken337 H
.33H I
None33I M
)33M N
;33N O
}44 	
private66 
string66 
CreateConnectionId66 )
(66) *
)66* +
{77 	
return88 
Guid88 
.88 
NewGuid88 
(88  
)88  !
.88! "
ToString88" *
(88* +
)88+ ,
;88, -
}99 	
}:: 
};; É
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\ServiceCollectionExtension.cs
	namespace 	
Web
 
. 
Stockets 
{ 
public		 

static		 
class		 &
ServiceCollectionExtension		 2
{

 
public 
static 
IServiceCollection (%
AddDataServiceWebStockets) B
(B C
thisC G
IServiceCollectionH Z
services[ c
)c d
{ 	
services 
. 
AddTransient !
<! "
IVideoService" /
,/ 0
VideoService1 =
>= >
(> ?
)? @
;@ A
return 
services 
; 
} 	
} 
} §
eC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\VideoChats\IVideoService.cs
	namespace 	
Web
 
. 
Stockets 
. 

VideoChats !
{ 
public 

	interface 
IVideoService "
{		 
string

 
GetTwilioJwt

 
(

 
string

 "
identity

# +
)

+ ,
;

, -
Task 
< 
IEnumerable 
< 
RoomDetails $
>$ %
>% &
GetAllRoomsAsync' 7
(7 8
)8 9
;9 :
} 
} ×
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\VideoChats\NotificationHub.cs
	namespace 	
Web
 
. 
Stockets 
. 

VideoChats !
{ 
public 

class 
NotificationHub  
{		 
} 
} ¾
cC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\VideoChats\RoomDetails.cs
	namespace 	
Web
 
. 
Stockets 
. 

VideoChats !
{ 
public 

class 
RoomDetails 
{ 
public		 
string		 
Id		 
{		 
get		 
;		 
set		  #
;		# $
}		% &
public

 
string

 
Name

 
{

 
get

  
;

  !
set

" %
;

% &
}

' (
public 
int 
ParticipantCount #
{$ %
get& )
;) *
set+ .
;. /
}0 1
public 
int 
MaxParticipants "
{# $
get% (
;( )
set* -
;- .
}/ 0
} 
} ª
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\VideoChats\TwilioSettings.cs
	namespace 	
Web
 
. 
Stockets 
. 

VideoChats !
{ 
public 

class 
TwilioSettings 
{ 
public 
string 

AccountSid  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
$str1 U
;U V
public 
string 
AccountSidTest $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
$str5 Y
;Y Z
public 
string 
	AuthToken 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$str0 R
;R S
public 
string 
AuthTokenTest #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
$str4 V
;V W
public 
string 
ApiKey 
{ 
get "
;" #
set$ '
;' (
}) *
=+ ,
$str- 6
;6 7
public 
string 
	ApiSecret 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$str0 R
;R S
} 
} š#
dC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\VideoChats\VideoService.cs
	namespace 	
Web
 
. 
Stockets 
. 

VideoChats !
{ 
public 

class 
VideoService 
: 
IVideoService  -
{ 
readonly 
TwilioSettings 
_twilioSettings  /
;/ 0
public 
VideoService 
( 
	Microsoft %
.% &

Extensions& 0
.0 1
Options1 8
.8 9
IOptions9 A
<A B
TwilioSettingsB P
>P Q
optionsR Y
)Y Z
{ 	
_twilioSettings 
= 
options %
?% &
.& '
Value' ,
??- /
throw0 5
new6 9!
ArgumentNullException: O
(O P
nameofP V
(V W
optionsW ^
)^ _
)_ `
;` a
TwilioClient 
. 
Init 
( 
_twilioSettings -
.- .
ApiKey. 4
,4 5
_twilioSettings6 E
.E F
	ApiSecretF O
)O P
;P Q
} 	
public 
string 
GetTwilioJwt "
(" #
string# )
identity* 2
)2 3
=> 
new 
Token 
( 
_twilioSettings (
.( )

AccountSid) 3
,3 4
_twilioSettings (
.( )
ApiKey) /
,/ 0
_twilioSettings (
.( )
	ApiSecret) 2
,2 3
identity !
??" $
Guid% )
.) *
NewGuid* 1
(1 2
)2 3
.3 4
ToString4 <
(< =
)= >
,> ?
grants 
:  
new! $
HashSet% ,
<, -
IGrant- 3
>3 4
{5 6
new7 :

VideoGrant; E
(E F
)F G
}H I
)I J
.J K
ToJwtK P
(P Q
)Q R
;R S
public"" 
async"" 
Task"" 
<"" 
IEnumerable"" %
<""% &
RoomDetails""& 1
>""1 2
>""2 3
GetAllRoomsAsync""4 D
(""D E
)""E F
{## 	
var$$ 
rooms$$ 
=$$ 
await$$ 
RoomResource$$ *
.$$* +
	ReadAsync$$+ 4
($$4 5
)$$5 6
;$$6 7
var%% 
tasks%% 
=%% 
rooms%% 
.%% 
Select%% $
(%%$ %
room&& 
=>&& 
GetRoomDetailsAsync&& +
(&&+ ,
room'' 
,'' 
ParticipantResource(( '
.((' (
	ReadAsync((( 1
(((1 2
room)) 
.)) 
Sid))  
,))  !
ParticipantStatus** )
.**) *
	Connected*** 3
)**3 4
)**4 5
)**5 6
;**6 7
return,, 
await,, 
Task,, 
.,, 
WhenAll,, %
(,,% &
tasks,,& +
),,+ ,
;,,, -
async.. 
Task.. 
<.. 
RoomDetails.. "
>.." #
GetRoomDetailsAsync..$ 7
(..7 8
RoomResource// 
room// !
,//! "
Task00 
<00 
ResourceSet00  
<00  !
ParticipantResource00! 4
>004 5
>005 6
participantTask007 F
)00F G
{11 
var22 
participants22  
=22! "
await22# (
participantTask22) 8
;228 9
return33 
new33 
RoomDetails33 &
{44 
Name55 
=55 
room55 
.55  

UniqueName55  *
,55* +
MaxParticipants66 #
=66$ %
room66& *
.66* +
MaxParticipants66+ :
??66; =
$num66> ?
,66? @
ParticipantCount77 $
=77% &
participants77' 3
.773 4
ToList774 :
(77: ;
)77; <
.77< =
Count77= B
}88 
;88 
}99 
}:: 	
};; 
}<< Ñ$
]C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\WebSocketHandler.cs
	namespace 	
Web
 
. 
Stockets 
{		 
public

 

abstract

 
class

 
WebSocketHandler

 *
{ 
	protected 
ConnectionManager #&
WebSocketConnectionManager$ >
{? @
getA D
;D E
setF I
;I J
}K L
public 
WebSocketHandler 
(  
ConnectionManager  1&
webSocketConnectionManager2 L
)L M
{ 	&
WebSocketConnectionManager &
=' (&
webSocketConnectionManager) C
;C D
} 	
public 
virtual 
async 
Task !
OnConnected" -
(- .
	WebSocket. 7
socket8 >
)> ?
{ 	&
WebSocketConnectionManager &
.& '
	AddSocket' 0
(0 1
socket1 7
)7 8
;8 9
} 	
public 
virtual 
async 
Task !
OnDisconnected" 0
(0 1
	WebSocket1 :
socket; A
)A B
{ 	
await &
WebSocketConnectionManager ,
., -
RemoveSocket- 9
(9 :&
WebSocketConnectionManager: T
.T U
GetIdU Z
(Z [
socket[ a
)a b
)b c
;c d
}   	
public"" 
async"" 
Task"" 
SendMessageAsync"" *
(""* +
	WebSocket""+ 4
socket""5 ;
,""; <
string""= C
message""D K
)""K L
{## 	
if$$ 
($$ 
socket$$ 
.$$ 
State$$ 
!=$$ 
WebSocketState$$  .
.$$. /
Open$$/ 3
)$$3 4
return%% 
;%% 
await'' 
socket'' 
.'' 
	SendAsync'' "
(''" #
buffer''# )
:'') *
new''+ .
ArraySegment''/ ;
<''; <
byte''< @
>''@ A
(''A B
array''B G
:''G H
Encoding''I Q
.''Q R
ASCII''R W
.''W X
GetBytes''X `
(''` a
message''a h
)''h i
,''i j
offset((D J
:((J K
$num((L M
,((M N
count))D I
:))I J
message))K R
.))R S
Length))S Y
)))Y Z
,))Z [
messageType**$ /
:**/ 0 
WebSocketMessageType**1 E
.**E F
Text**F J
,**J K
endOfMessage++$ 0
:++0 1
true++2 6
,++6 7
cancellationToken,,$ 5
:,,5 6
CancellationToken,,7 H
.,,H I
None,,I M
),,M N
;,,N O
}-- 	
public55 
async55 
Task55 
SendMessageAsync55 *
(55* +
string55+ 1
socketId552 :
,55: ;
string55< B
message55C J
)55J K
{66 	
await77 
SendMessageAsync77 "
(77" #&
WebSocketConnectionManager77# =
.77= >
GetSocketById77> K
(77K L
socketId77L T
)77T U
,77U V
message77W ^
)77^ _
;77_ `
}88 	
public?? 
async?? 
Task?? !
SendMessageToAllAsync?? /
(??/ 0
string??0 6
message??7 >
)??> ?
{@@ 	
foreachAA 
(AA 
varAA 
pairAA 
inAA  &
WebSocketConnectionManagerAA! ;
.AA; <
GetAllAA< B
(AAB C
)AAC D
)AAD E
{BB 
ifCC 
(CC 
pairCC 
.CC 
ValueCC 
.CC 
StateCC $
==CC% '
WebSocketStateCC( 6
.CC6 7
OpenCC7 ;
)CC; <
awaitDD 
SendMessageAsyncDD *
(DD* +
pairDD+ /
.DD/ 0
ValueDD0 5
,DD5 6
messageDD7 >
)DD> ?
;DD? @
}EE 
}FF 	
publicOO 
abstractOO 
TaskOO 
ReceiveAsyncOO )
(OO) *
	WebSocketOO* 3
socketOO4 :
,OO: ;"
WebSocketReceiveResultOO< R
resultOOS Y
,OOY Z
byteOO[ _
[OO_ `
]OO` a
bufferOOb h
)OOh i
;OOi j
}PP 
}QQ i
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Stockets\WebSocketManagerMiddleware.cs