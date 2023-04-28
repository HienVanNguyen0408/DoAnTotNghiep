ºI
^C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.MessageQ\Consumer\Consumer.cs
	namespace 	
Web
 
. 
MessageQ 
. 
Consumer 
{ 
public 

class 
Consumer 
< 
T 
> 
: 
	IConsumer (
<( )
T) *
>* +
{ 
ConnectionFactory 
_advancedBus &
;& '
private 
readonly 
QueueSettings &
_queueSettings' 5
;5 6
IConnection 
_connection 
;  
IModel 
_channel 
; 
IBasicProperties 
_properties $
;$ %
private !
EventingBasicConsumer %
	_consumer& /
;/ 0
Func 
< 
T 
, 
IDictionary 
< 
string "
," #
object$ *
>* +
,+ ,
Task- 1
<1 2
bool2 6
>6 7
>7 8!
_onMessageHandleAsync9 N
;N O
public 
Consumer 
( 
IOptions  
<  !
QueueSettings! .
>. /
options0 7
)7 8
{ 	
_queueSettings 
= 
options $
.$ %
Value% *
;* +
} 	
public!! 
Consumer!! 
(!! 
QueueSettings!! %
queueSettings!!& 3
)!!3 4
{"" 	
_queueSettings## 
=## 
queueSettings## *
;##* +
	InitQueue$$ 
($$ 
queueSettings$$ #
)$$# $
;$$$ %
}%% 	
private'' 
void'' 
	InitQueue'' 
('' 
QueueSettings'' ,
queueSettings''- :
)'': ;
{(( 	
_advancedBus)) 
=)) 
new)) 
ConnectionFactory)) 0
())0 1
)))1 2
{** 
HostName++ 
=++ 
queueSettings++ (
.++( )
Host++) -
,++- .
RequestedHeartbeat,, "
=,,# $
TimeSpan,,% -
.,,- .
FromSeconds,,. 9
(,,9 :
queueSettings,,: G
.,,G H
RequestedHeartbeat,,H Z
),,Z [
,,,[ \
ContinuationTimeout-- #
=--$ %
TimeSpan--& .
.--. /
FromSeconds--/ :
(--: ;
queueSettings--; H
.--H I
Timeout--I P
)--P Q
,--Q R
Port.. 
=.. 
queueSettings.. $
...$ %
Port..% )
,..) *
UserName// 
=// 
queueSettings// (
.//( )
UserName//) 1
,//1 2
Password00 
=00 
queueSettings00 (
.00( )
Password00) 1
}11 
;11 
var22 
con22 
=22 
_advancedBus22 "
.22" #
CreateConnection22# 3
(223 4
)224 5
;225 6
_connection33 
=33 
_advancedBus33 &
.33& '
CreateConnection33' 7
(337 8
)338 9
;339 :
_channel44 
=44 
_connection44 "
.44" #
CreateModel44# .
(44. /
)44/ 0
;440 1
_properties55 
=55 
_channel55 "
.55" #!
CreateBasicProperties55# 8
(558 9
)559 :
;55: ;
}66 	
public>> 
Task>> 
StartConsumeAsync>> %
(>>% &
string>>& ,
	queueName>>- 6
,>>6 7
Func>>8 <
<>>< =
T>>= >
,>>> ?
IDictionary>>@ K
<>>K L
string>>L R
,>>R S
object>>T Z
>>>Z [
,>>[ \
Task>>] a
<>>a b
bool>>b f
>>>f g
>>>g h
onMessageHandle>>i x
)>>x y
{?? 	
return@@ 
Task@@ 
.@@ 
Run@@ 
(@@ 
(@@ 
)@@ 
=>@@ !
StartConsume@@" .
(@@. /
	queueName@@/ 8
,@@8 9
onMessageHandle@@: I
)@@I J
)@@J K
;@@K L
}AA 	
privateCC 
voidCC 
StartConsumeCC !
(CC! "
stringCC" (
	queueNameCC) 2
,CC2 3
FuncCC4 8
<CC8 9
TCC9 :
,CC: ;
IDictionaryCC< G
<CCG H
stringCCH N
,CCN O
objectCCP V
>CCV W
,CCW X
TaskCCY ]
<CC] ^
boolCC^ b
>CCb c
>CCc d
onMessageHandleCCe t
)CCt u
{DD 	!
_onMessageHandleAsyncEE !
=EE" #
onMessageHandleEE$ 3
;EE3 4
_channelFF 
.FF 
QueueDeclareFF !
(FF! "
	queueNameFF" +
,FF+ ,
falseFF- 2
,FF2 3
falseFF4 9
,FF9 :
falseFF; @
,FF@ A
nullFFB F
)FFF G
;FFG H
	_consumerGG 
=GG 
newGG !
EventingBasicConsumerGG 1
(GG1 2
_channelGG2 :
)GG: ;
;GG; <
	_consumerHH 
.HH 
ReceivedHH 
+=HH !
asyncHH" '
(HH( )
modelHH) .
,HH. /
resultHH0 6
)HH6 7
=>HH8 :
{II 
varJJ 
bodyJJ 
=JJ 
resultJJ !
.JJ! "
BodyJJ" &
.JJ& '
ToArrayJJ' .
(JJ. /
)JJ/ 0
;JJ0 1
varKK 
messageKK 
=KK 
EncodingKK &
.KK& '
UTF8KK' +
.KK+ ,
	GetStringKK, 5
(KK5 6
bodyKK6 :
)KK: ;
;KK; <
TLL 
queueObjectLL 
=LL 
	JsonUtilsLL  )
.LL) *
DeserializeLL* 5
<LL5 6
TLL6 7
>LL7 8
(LL8 9
messageLL9 @
)LL@ A
;LLA B
varMM 
headersMM 
=MM 
resultMM $
.MM$ %
BasicPropertiesMM% 4
.MM4 5
HeadersMM5 <
;MM< =
ifNN 
(NN 
!NN 
resultNN 
.NN 
RedeliveredNN '
)NN' (
{OO 
boolPP 
consumeResultPP &
=PP' (
falsePP) .
;PP. /
tryQQ 
{RR 
consumeResultSS %
=SS& '
awaitSS( -
onMessageHandleSS. =
(SS= >
queueObjectSS> I
,SSI J
headersSSK R
)SSR S
;SSS T
}TT 
catchUU 
(UU 
	ExceptionUU $
exUU% '
)UU' (
{VV 
consumeResultWW %
=WW& '
falseWW( -
;WW- .
}XX 
ConsoleYY 
.YY 
	WriteLineYY %
(YY% &
$"YY& (
$strYY( 6
{YY6 7
messageYY7 >
}YY> ?
"YY? @
)YY@ A
;YYA B
}ZZ 
}[[ 
;[[ 
_channel\\ 
.\\ 
BasicConsume\\ !
(\\! "
	queueName\\" +
,\\+ ,
false\\- 2
,\\2 3
	_consumer\\4 =
)\\= >
;\\> ?
}]] 	
private^^ 
async^^ 
Task^^ 
<^^ 
bool^^ 
>^^  
MessageHandleAsync^^! 3
(^^3 4
byte^^4 8
[^^8 9
]^^9 :
body^^; ?
,^^? @
MessageProperties^^A R

properties^^S ]
,^^] ^
MessageReceivedInfo^^_ r
messInfo^^s {
)^^{ |
{__ 	
string`` 
message`` 
=`` 
body`` !
!=``" $
null``% )
&&``* ,
body``- 1
.``1 2
Length``2 8
>``9 :
$num``; <
?``= >
Encoding``? G
.``G H
UTF8``H L
.``L M
	GetString``M V
(``V W
body``W [
)``[ \
:``] ^
null``_ c
;``c d
Taa 
queueObjectaa 
=aa 
	JsonUtilsaa %
.aa% &
Deserializeaa& 1
<aa1 2
Taa2 3
>aa3 4
(aa4 5
messageaa5 <
)aa< =
;aa= >
varcc 
headerscc 
=cc 

propertiescc $
.cc$ %
Headerscc% ,
;cc, -
booldd 
consumeResultdd 
=dd  
falsedd! &
;dd& '
tryee 
{ff 
consumeResultgg 
=gg 
awaitgg  %!
_onMessageHandleAsyncgg& ;
(gg; <
queueObjectgg< G
,ggG H
headersggI P
)ggP Q
;ggQ R
}hh 
catchii 
(ii 
	Exceptionii 
exii 
)ii  
{jj 
consumeResultkk 
=kk 
falsekk  %
;kk% &
}ll 
returnnn 
consumeResultnn  
;nn  !
}oo 	
}qq 
}rr É
_C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.MessageQ\Consumer\IConsumer.cs
	namespace 	
Web
 
. 
MessageQ 
. 
Consumer 
{ 
public		 

	interface		 
	IConsumer		 
<		 
T		  
>		  !
{

 
Task 
StartConsumeAsync 
( 
string %
	queueName& /
,/ 0
Func1 5
<5 6
T6 7
,7 8
IDictionary9 D
<D E
stringE K
,K L
objectM S
>S T
?T U
,U V
TaskW [
<[ \
bool\ `
>` a
>a b
onMessageHandlec r
)r s
;s t
} 
} ¢
aC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.MessageQ\Publisher\IPublisher.cs
	namespace 	
Web
 
. 
MessageQ 
. 
	Publisher  
{ 
public		 

	interface		 

IPublisher		 
{

 
bool 
Publish 
( 
string 
	queueName %
,% &
object' -
data. 2
,2 3
IDictionary4 ?
<? @
string@ F
,F G
objectH N
>N O
headersP W
=X Y
nullZ ^
)^ _
;_ `
void 
PublishAsync 
( 
string  
	queueName! *
,* +
object, 2
data3 7
,7 8
IDictionary9 D
<D E
stringE K
,K L
objectM S
>S T
headersU \
=] ^
null_ c
)c d
;d e
} 
} ‘3
`C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.MessageQ\Publisher\Publisher.cs
	namespace 	
Web
 
. 
MessageQ 
. 
	Publisher  
{ 
public 

class 
	Publisher 
: 

IPublisher '
{ 
ConnectionFactory 
_advancedBus &
;& '
IConnection 
_connection 
;  
IModel 
_chanel 
; 
IBasicProperties 
_properties $
;$ %
public 
	Publisher 
( 
IOptions !
<! "
QueueSettings" /
>/ 0
options1 8
)8 9
{ 	
	InitQueue 
( 
options 
. 
Value #
)# $
;$ %
} 	
public 
	Publisher 
( 
QueueSettings &
queueSettings' 4
)4 5
{ 	
	InitQueue 
( 
queueSettings #
)# $
;$ %
} 	
private&& 
void&& 
	InitQueue&& 
(&& 
QueueSettings&& ,
queueSettings&&- :
)&&: ;
{'' 	
_advancedBus(( 
=(( 
new(( 
ConnectionFactory(( 0
(((0 1
)((1 2
{)) 
HostName** 
=** 
queueSettings** (
.**( )
Host**) -
,**- .
RequestedHeartbeat++ "
=++# $
TimeSpan++% -
.++- .
FromSeconds++. 9
(++9 :
queueSettings++: G
.++G H
RequestedHeartbeat++H Z
)++Z [
,++[ \
ContinuationTimeout,, #
=,,$ %
TimeSpan,,& .
.,,. /
FromSeconds,,/ :
(,,: ;
queueSettings,,; H
.,,H I
Timeout,,I P
),,P Q
,,,Q R
Port-- 
=-- 
queueSettings-- $
.--$ %
Port--% )
,--) *
UserName.. 
=.. 
queueSettings.. (
...( )
UserName..) 1
,..1 2
Password// 
=// 
queueSettings// (
.//( )
Password//) 1
}00 
;00 
var11 
con11 
=11 
_advancedBus11 "
.11" #
CreateConnection11# 3
(113 4
)114 5
;115 6
_connection22 
=22 
_advancedBus22 &
.22& '
CreateConnection22' 7
(227 8
)228 9
;229 :
_chanel33 
=33 
_connection33 !
.33! "
CreateModel33" -
(33- .
)33. /
;33/ 0
_properties44 
=44 
_chanel44 !
.44! "!
CreateBasicProperties44" 7
(447 8
)448 9
;449 :
}55 	
public77 
bool77 
Publish77 
(77 
string77 "
	queueName77# ,
,77, -
object77. 4
data775 9
,779 :
IDictionary77; F
<77F G
string77G M
,77M N
object77O U
>77U V
headers77W ^
=77_ `
null77a e
)77e f
{88 	
PublishAsync99 
(99 
	queueName99 "
,99" #
data99$ (
,99( )
headers99* 1
)991 2
;992 3
return:: 
true:: 
;:: 
};; 	
public== 
void== 
PublishAsync==  
(==  !
string==! '
	queueName==( 1
,==1 2
object==3 9
data==: >
,==> ?
IDictionary==@ K
<==K L
string==L R
,==R S
object==T Z
>==Z [
headers==\ c
===d e
null==f j
)==j k
{>> 	
if?? 
(?? 
string?? 
.?? 
IsNullOrEmpty?? $
(??$ %
	queueName??% .
)??. /
)??/ 0
throw??1 6
new??7 :!
ArgumentNullException??; P
(??P Q
nameof??Q W
(??W X
	queueName??X a
)??a b
)??b c
;??c d
if@@ 
(@@ 
data@@ 
==@@ 
null@@ 
)@@ 
throw@@ #
new@@$ '!
ArgumentNullException@@( =
(@@= >
nameof@@> D
(@@D E
data@@E I
)@@I J
)@@J K
;@@K L
_propertiesBB 
.BB 

PersistentBB "
=BB# $
falseBB% *
;BB* +
_propertiesCC 
.CC 
DeliveryModeCC $
=CC% &
$numCC' (
;CC( )
ifDD 
(DD 
headersDD 
!=DD 
nullDD 
&&DD  "
headersDD# *
.DD* +
CountDD+ 0
>DD1 2
$numDD3 4
)DD4 5
_propertiesDD6 A
.DDA B
HeadersDDB I
=DDJ K
headersDDL S
;DDS T
stringFF 
messageFF 
=FF 
	JsonUtilsFF &
.FF& '
	SerializeFF' 0
(FF0 1
dataFF1 5
)FF5 6
;FF6 7
varGG 
queueMessageGG 
=GG 
EncodingGG '
.GG' (
UTF8GG( ,
.GG, -
GetBytesGG- 5
(GG5 6
messageGG6 =
)GG= >
;GG> ?
varHH 
exchangeNameHH 
=HH 
$strHH /
;HH/ 0
_chanelKK 
.KK 
QueueDeclareKK  
(KK  !
queueKK! &
:KK& '
	queueNameKK( 1
,KK1 2
falseKK3 8
,KK8 9
falseKK: ?
,KK? @
falseKKA F
,KKF G
nullKKH L
)KKL M
;KKM N
_chanelMM 
.MM 
BasicPublishMM  
(MM  !
exchangeMM! )
:MM) *
$strMM+ -
,MM- .

routingKeyMM/ 9
:MM9 :
	queueNameMM; D
,MMD E
basicPropertiesMMF U
:MMU V
_propertiesMMW b
,MMb c
bodyMMd h
:MMh i
queueMessageMMj v
)MMv w
;MMw x
ConsoleNN 
.NN 
	WriteLineNN 
(NN 
$strNN ,
)NN, -
;NN- .
}OO 	
}RR 
}SS ¢
ZC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.MessageQ\QueueSettings.cs
	namespace 	
Web
 
. 
MessageQ 
{ 
public		 

class		 
QueueSettings		 
{

 
public 
const 
string 
CONFIG_NAME '
=( )
$str* 9
;9 :
public 
string 
ConnectionString &
{' (
get) ,
;, -
set. 1
;1 2
}3 4
public 
ushort 
WithPrefecthCount '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
=6 7
$num8 :
;: ;
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
Exchange 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
int 
RequestedHeartbeat %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
bool 
PublisherConfirms %
{& '
get( +
;+ ,
set- 0
;0 1
}2 3
public 
ushort 
Timeout 
{ 
get  #
;# $
set% (
;( )
}* +
public 
ushort 
Port 
{ 
get  
;  !
set" %
;% &
}' (
public 
string 
VirtualHost !
{" #
get$ '
;' (
set) ,
;, -
}. /
public 
string 
UserName 
{  
get! $
;$ %
set& )
;) *
}+ ,
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
}!! 
}"" 