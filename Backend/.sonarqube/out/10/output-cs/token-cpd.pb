€&
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\ServiceCollectionExtension.cs
	namespace 	
Web
 
. 
Infrastructure 
{ 
public 

static 
class &
ServiceCollectionExtension 2
{ 
public 
static 
IServiceCollection ( 
AddDataInfastructure) =
(= >
this> B
IServiceCollectionC U
servicesV ^
,^ _
IConfiguration` n
configurationo |
)| }
{ 	
services 
. 
AddTransient !
(! "
typeof" (
(( )
	IBaseRepo) 2
<2 3
>3 4
)4 5
,5 6
typeof7 =
(= >
BaseRepo> F
<F G
>G H
)H I
)I J
;J K
services 
. 
AddTransient !
<! "
IUserUoW" *
,* +
UserUoW, 3
>3 4
(4 5
)5 6
;6 7
services 
. 
AddTransient !
<! "
IProductUoW" -
,- .

ProductUoW/ 9
>9 :
(: ;
); <
;< =
services 
. 
AddTransient !
<! "
	IColorUoW" +
,+ ,
ColorUoW- 5
>5 6
(6 7
)7 8
;8 9
services 
. 
AddTransient !
<! "
ISizeUoW" *
,* +
SizeUoW, 3
>3 4
(4 5
)5 6
;6 7
services 
. 
AddTransient !
<! "
IProductCategoryUoW" 5
,5 6
ProductCategoryUoW7 I
>I J
(J K
)K L
;L M
services 
. 
AddTransient !
<! "
	IOrderUoW" +
,+ ,
OrderUoW- 5
>5 6
(6 7
)7 8
;8 9
services 
. 
AddTransient !
<! "
IOrderItemUoW" /
,/ 0
OrderItemUoW1 =
>= >
(> ?
)? @
;@ A
services 
. 
AddTransient !
<! "
IBlogUoW" *
,* +
BlogUoW, 3
>3 4
(4 5
)5 6
;6 7
services   
.   
AddTransient   !
<  ! "
IBlogCategoryUoW  " 2
,  2 3
BlogCategoryUoW  4 C
>  C D
(  D E
)  E F
;  F G
services!! 
.!! 
AddTransient!! !
<!!! "
	IImageUoW!!" +
,!!+ ,
ImageUoW!!- 5
>!!5 6
(!!6 7
)!!7 8
;!!8 9
services"" 
."" 
AddTransient"" !
<""! "
IPermissionUoW""" 0
,""0 1
PermissionUoW""2 ?
>""? @
(""@ A
)""A B
;""B C
services## 
.## 
AddTransient## !
<##! " 
IPermissionDetailUoW##" 6
,##6 7
PermissionDetailUoW##8 K
>##K L
(##L M
)##M N
;##N O
services$$ 
.$$ 
AddTransient$$ !
<$$! "&
IPermissionRelationshipUoW$$" <
,$$< =%
PermissionRelationshipUoW$$> W
>$$W X
($$X Y
)$$Y Z
;$$Z [
services%% 
.%% 
AddTransient%% !
<%%! "
IAddressInfoUoW%%" 1
,%%1 2
AddressInfoUoW%%3 A
>%%A B
(%%B C
)%%C D
;%%D E
services'' 
.'' !
AddServiceEmailClient'' *
(''* +
)''+ ,
;'', -
return(( 
services(( 
;(( 
})) 	
public++ 
static++ 
IServiceCollection++ (!
AddServiceEmailClient++) >
(++> ?
this++? C
IServiceCollection++D V
services++W _
)++_ `
{,, 	
services-- 
.-- 
AddTransient-- !
<--! "
ISendMailClient--" 1
,--1 2
SendMailClient--3 A
>--A B
(--B C
)--C D
;--D E
services.. 
... 
AddTransient.. !
<..! "

IGHNClient.." ,
,.., -
	GHNClient... 7
>..7 8
(..8 9
)..9 :
;..: ;
services// 
.// 
AddTransient// !
<//! "
IMomoClient//" -
,//- .

MomoClient/// 9
>//9 :
(//: ;
)//; <
;//< =
return00 
services00 
;00 
}11 	
}33 
}44 —

oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Email\EmailSettings.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
{ 
public		 

class		 
EmailSettings		 
{

 
public 
string 
Mail 
{ 
get  
;  !
set" %
;% &
}' (
=) *
$str+ J
;J K
public 
string 
DisplayName !
{" #
get$ '
;' (
set) ,
;, -
}. /
=0 1
$str2 C
;C D
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
$str/ =
;= >
public 
string 
Host 
{ 
get  
;  !
set" %
;% &
}' (
=) *
$str+ ;
;; <
public 
int 
Port 
{ 
get 
; 
set "
;" #
}$ %
=& '
$num( +
;+ ,
} 
} ê
qC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Email\ISendMailClient.cs
	namespace		 	
Web		
 
.		 
Infrastructure		 
.		 
Services		 %
{

 
public 

	interface 
ISendMailClient $
{ 
Task   
<   
bool   
>   
SendMailLocalSmtp   $
(  $ %
string  % +
from  , 0
,  0 1
string  2 8
to  9 ;
,  ; <
string  = C
subject  D K
,  K L
string  M S
body  T X
)  X Y
;  Y Z
Task,, 
<,, 
bool,, 
>,, 
SendMailGoogleSmtp,, %
(,,% &
string,,& ,
from,,- 1
,,,1 2
string,,3 9
to,,: <
,,,< =
string,,> D
subject,,E L
,,,L M
string,,N T
body,,U Y
,,,Y Z
string,,[ a
	gmailsend,,b k
,,,k l
string,,m s
gmailpassword	,,t Å
)
,,Å Ç
;
,,Ç É
Task// 
SendMailAsync// 
(// 
MailContent// &
mailContent//' 2
)//2 3
;//3 4
Task00 
SendMailAsync00 
(00 
string00 !
email00" '
,00' (
string00) /
subject000 7
,007 8
string009 ?
htmlMessage00@ K
)00K L
;00L M
}11 
}22 „c
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Email\SendMailClient.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
{ 
public 

class 
SendMailClient 
:  !
	BaseClass" +
<+ ,
SendMailClient, :
>: ;
,; <
ISendMailClient= L
{ 
private 
const 
string 
TAG  
=! "
$str# 3
;3 4
	protected 

SmtpClient 
_smtpClient (
;( )
	protected 
EmailSettings 
_emailSettings  .
;. /
public 
SendMailClient 
( 
IOptions &
<& '
EmailSettings' 4
>4 5
options6 =
,= >
IServiceProvider> N
serviceProviderO ^
)^ _
:` a
baseb f
(f g
serviceProviderg v
)v w
{ 	
_emailSettings 
= 
options $
.$ %
Value% *
;* +
} 	
public(( 
async(( 
Task(( 
<(( 
bool(( 
>(( 
SendMail((  (
(((( )
string(() /
from((0 4
,((4 5
string((6 <
to((= ?
,((? @
string((A G
subject((H O
,((O P
string((Q W
body((X \
,((\ ]

SmtpClient((^ h
client((i o
)((o p
{)) 	
MailMessage++ 
message++ 
=++  !
new++" %
MailMessage++& 1
(++1 2
from,, 
:,, 
from,, 
,,, 
to-- 
:-- 
to-- 
,-- 
subject.. 
:.. 
subject..  
,..  !
body// 
:// 
body// 
)00 
;00 
message11 
.11 
BodyEncoding11  
=11! "
System11# )
.11) *
Text11* .
.11. /
Encoding11/ 7
.117 8
UTF8118 <
;11< =
message22 
.22 
SubjectEncoding22 #
=22$ %
System22& ,
.22, -
Text22- 1
.221 2
Encoding222 :
.22: ;
UTF822; ?
;22? @
message33 
.33 

IsBodyHtml33 
=33  
true33! %
;33% &
message44 
.44 
ReplyToList44 
.44  
Add44  #
(44# $
new44$ '
MailAddress44( 3
(443 4
from444 8
)448 9
)449 :
;44: ;
message55 
.55 
Sender55 
=55 
new55  
MailAddress55! ,
(55, -
from55- 1
)551 2
;552 3
try77 
{88 
await99 
client99 
.99 
SendMailAsync99 *
(99* +
message99+ 2
)992 3
;993 4
return:: 
true:: 
;:: 
};; 
catch<< 
(<< 
	Exception<< 
ex<< 
)<<  
{== 
_logger>> 
.>> 
LogError>>  
(>>  !
$">>! #
{>># $
TAG>>$ '
}>>' (
$str>>( G
{>>G H
ex>>H J
.>>J K
Message>>K R
}>>R S
">>S T
)>>T U
;>>U V
return?? 
false?? 
;?? 
}@@ 
}AA 	
publicEE 
asyncEE 
TaskEE 
<EE 
boolEE 
>EE 
SendMailLocalSmtpEE  1
(EE1 2
stringEE2 8
fromEE9 =
,EE= >
stringEE? E
toEEF H
,EEH I
stringEEJ P
subjectEEQ X
,EEX Y
stringEEZ `
bodyEEa e
)EEe f
{FF 	
usingGG 
(GG 

SmtpClientGG 
clientGG $
=GG% &
newGG' *

SmtpClientGG+ 5
(GG5 6
$strGG6 A
)GGA B
)GGB C
{HH 
returnII 
awaitII 
SendMailII %
(II% &
fromII& *
,II* +
toII, .
,II. /
subjectII0 7
,II7 8
bodyII9 =
,II= >
clientII? E
)IIE F
;IIF G
}JJ 
}KK 	
publicPP 
asyncPP 
TaskPP 
<PP 
boolPP 
>PP 
SendMailGoogleSmtpPP  2
(PP2 3
stringPP3 9
fromPP: >
,PP> ?
stringPP@ F
toPPG I
,PPI J
stringPPK Q
subjectPPR Y
,PPY Z
stringPP[ a
bodyPPb f
,PPf g
stringPPh n
	gmailsendPPo x
,PPx y
string	PPz Ä
gmailpassword
PPÅ é
)
PPé è
{QQ 	
MailMessageSS 
messageSS 
=SS  !
newSS" %
MailMessageSS& 1
(SS1 2
fromTT 
:TT 
fromTT 
,TT 
toUU 
:UU 
toUU 
,UU 
subjectVV 
:VV 
subjectVV  
,VV  !
bodyWW 
:WW 
bodyWW 
)XX 
;XX 
messageYY 
.YY 
BodyEncodingYY  
=YY! "
SystemYY# )
.YY) *
TextYY* .
.YY. /
EncodingYY/ 7
.YY7 8
UTF8YY8 <
;YY< =
messageZZ 
.ZZ 
SubjectEncodingZZ #
=ZZ$ %
SystemZZ& ,
.ZZ, -
TextZZ- 1
.ZZ1 2
EncodingZZ2 :
.ZZ: ;
UTF8ZZ; ?
;ZZ? @
message[[ 
.[[ 

IsBodyHtml[[ 
=[[  
true[[! %
;[[% &
message\\ 
.\\ 
ReplyToList\\ 
.\\  
Add\\  #
(\\# $
new\\$ '
MailAddress\\( 3
(\\3 4
from\\4 8
)\\8 9
)\\9 :
;\\: ;
message]] 
.]] 
Sender]] 
=]] 
new]]  
MailAddress]]! ,
(]], -
from]]- 1
)]]1 2
;]]2 3
using`` 
(`` 

SmtpClient`` 
client`` $
=``% &
new``' *

SmtpClient``+ 5
(``5 6
$str``6 F
)``F G
)``G H
{aa 
clientbb 
.bb 
Portbb 
=bb 
$numbb !
;bb! "
clientcc 
.cc 
Credentialscc "
=cc# $
newcc% (
NetworkCredentialcc) :
(cc: ;
	gmailsendcc; D
,ccD E
gmailpasswordccF S
)ccS T
;ccT U
clientdd 
.dd 
	EnableSsldd  
=dd! "
truedd# '
;dd' (
returnee 
awaitee 
SendMailee %
(ee% &
fromee& *
,ee* +
toee, .
,ee. /
subjectee0 7
,ee7 8
bodyee9 =
,ee= >
clientee? E
)eeE F
;eeF G
}ff 
}gg 	
publickk 
asynckk 
Taskkk 
SendMailAsynckk '
(kk' (
MailContentkk( 3
mailContentkk4 ?
)kk? @
{ll 	
varmm 
emailmm 
=mm 
newmm 
MimeMessagemm '
(mm' (
)mm( )
;mm) *
emailnn 
.nn 
Sendernn 
=nn 
newnn 
MailboxAddressnn -
(nn- .
_emailSettingsnn. <
.nn< =
DisplayNamenn= H
,nnH I
_emailSettingsnnJ X
.nnX Y
MailnnY ]
)nn] ^
;nn^ _
emailoo 
.oo 
Fromoo 
.oo 
Addoo 
(oo 
newoo 
MailboxAddressoo -
(oo- .
_emailSettingsoo. <
.oo< =
DisplayNameoo= H
,ooH I
_emailSettingsooJ X
.ooX Y
MailooY ]
)oo] ^
)oo^ _
;oo_ `
emailpp 
.pp 
Topp 
.pp 
Addpp 
(pp 
MailboxAddresspp '
.pp' (
Parsepp( -
(pp- .
mailContentpp. 9
.pp9 :
Topp: <
)pp< =
)pp= >
;pp> ?
emailqq 
.qq 
Subjectqq 
=qq 
mailContentqq '
.qq' (
Subjectqq( /
;qq/ 0
vartt 
buildertt 
=tt 
newtt 
BodyBuildertt )
(tt) *
)tt* +
;tt+ ,
builderuu 
.uu 
HtmlBodyuu 
=uu 
mailContentuu *
.uu* +
Bodyuu+ /
;uu/ 0
emailvv 
.vv 
Bodyvv 
=vv 
buildervv  
.vv  !
ToMessageBodyvv! .
(vv. /
)vv/ 0
;vv0 1
usingyy 
varyy 
smtpyy 
=yy 
newyy  
MailKityy! (
.yy( )
Netyy) ,
.yy, -
Smtpyy- 1
.yy1 2

SmtpClientyy2 <
(yy< =
)yy= >
;yy> ?
try{{ 
{|| 
smtp}} 
.}} 
Connect}} 
(}} 
_emailSettings}} +
.}}+ ,
Host}}, 0
,}}0 1
_emailSettings}}2 @
.}}@ A
Port}}A E
,}}E F
SecureSocketOptions}}G Z
.}}Z [
StartTls}}[ c
)}}c d
;}}d e
smtp~~ 
.~~ 
Authenticate~~ !
(~~! "
_emailSettings~~" 0
.~~0 1
Mail~~1 5
,~~5 6
_emailSettings~~7 E
.~~E F
Password~~F N
)~~N O
;~~O P
await 
smtp 
. 
	SendAsync $
($ %
email% *
)* +
;+ ,
}
ÄÄ 
catch
ÅÅ 
(
ÅÅ 
	Exception
ÅÅ 
ex
ÅÅ 
)
ÅÅ  
{
ÇÇ 
System
ÑÑ 
.
ÑÑ 
IO
ÑÑ 
.
ÑÑ 
	Directory
ÑÑ #
.
ÑÑ# $
CreateDirectory
ÑÑ$ 3
(
ÑÑ3 4
$str
ÑÑ4 ?
)
ÑÑ? @
;
ÑÑ@ A
var
ÖÖ 
emailsavefile
ÖÖ !
=
ÖÖ" #
string
ÖÖ$ *
.
ÖÖ* +
Format
ÖÖ+ 1
(
ÖÖ1 2
$str
ÖÖ2 F
,
ÖÖF G
Guid
ÖÖH L
.
ÖÖL M
NewGuid
ÖÖM T
(
ÖÖT U
)
ÖÖU V
)
ÖÖV W
;
ÖÖW X
await
ÜÜ 
email
ÜÜ 
.
ÜÜ 
WriteToAsync
ÜÜ (
(
ÜÜ( )
emailsavefile
ÜÜ) 6
)
ÜÜ6 7
;
ÜÜ7 8
_logger
áá 
.
áá 
LogInformation
áá &
(
áá& '
$"
áá' )
{
áá) *
TAG
áá* -
}
áá- .
$str
áá. `
{
áá` a
emailsavefile
ááa n
}
áán o
$str
ááo |
{
áá| }
ex
áá} 
.áá Ä
MessageááÄ á
}ááá à
"ááà â
)ááâ ä
;ááä ã
}
àà 
smtp
ää 
.
ää 

Disconnect
ää 
(
ää 
true
ää  
)
ää  !
;
ää! "
_logger
åå 
.
åå 
LogInformation
åå "
(
åå" #
$"
åå# %
{
åå% &
TAG
åå& )
}
åå) *
$str
åå* L
"
ååL M
+
ååN O
mailContent
ååP [
.
åå[ \
To
åå\ ^
)
åå^ _
;
åå_ `
}
éé 	
public
èè 
async
èè 
Task
èè 
SendMailAsync
èè '
(
èè' (
string
èè( .
email
èè/ 4
,
èè4 5
string
èè6 <
subject
èè= D
,
èèD E
string
èèF L
htmlMessage
èèM X
)
èèX Y
{
êê 	
await
ëë 
SendMailAsync
ëë 
(
ëë  
new
ëë  #
MailContent
ëë$ /
(
ëë/ 0
)
ëë0 1
{
íí 
To
ìì 
=
ìì 
email
ìì 
,
ìì 
Subject
îî 
=
îî 
subject
îî !
,
îî! "
Body
ïï 
=
ïï 
htmlMessage
ïï "
}
ññ 
)
ññ 
;
ññ 
}
óó 	
}
ôô 
}öö ™â
iC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\GHN\GHNClient.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
.% &
GHN& )
{ 
public 

class 
	GHNClient 
: 

IGHNClient '
{ 
	protected 

Dictionary 
< 
string #
,# $
string% +
>+ ,
_header- 4
=5 6
null7 ;
;; <
	protected 
GHNSettings 
_ghnSettings *
=+ ,
null- 1
;1 2
	protected 
	StoreInfo 
	storeInfo %
=& '
null( ,
;, -
public 
	GHNClient 
( 
IOptions !
<! "
GHNSettings" -
>- .
options/ 6
)6 7
{ 	
_ghnSettings 
= 
options "
." #
Value# (
;( )
_header 
= 
new 

Dictionary $
<$ %
string% +
,+ ,
string- 3
>3 4
{ 
{ 
$str 
, 
_ghnSettings %
.% &
Token& +
}, -
,- .
} 
; 
	storeInfo 
= 
new 
	StoreInfo %
(% &
)& '
;' (
} 	
public)) 
async)) 
Task)) 
<)) 
OrderRespone)) &
>))& '
CreateOrderAsync))( 8
())8 9
OrderRequest))9 E
request))F M
)))M N
{** 	
if++ 
(++ 
_header++ 
==++ 
null++ 
)++  
_header++! (
=++) *
new+++ .

Dictionary++/ 9
<++9 :
string++: @
,++@ A
string++B H
>++H I
(++I J
)++J K
;++K L
_header,, 
.,, 
Add,, 
(,, 
$str,,  
,,,  !
$",," $
{,,$ %
_ghnSettings,,% 1
.,,1 2
ShopId,,2 8
},,8 9
",,9 :
),,: ;
;,,; <
var-- 
jsonBody-- 
=-- 
request-- "
;--" #
var.. 
	resultSvc.. 
=.. 
await.. !
StandardHttpClient.." 4
...4 5 
DoPostOrPutJsonAsync..5 I
(..I J
$"..J L
{..L M
_ghnSettings..M Y
...Y Z
ApiCreateOrder..Z h
}..h i
"..i j
,..j k

HttpMethod..l v
...v w
Post..w {
,..{ |
jsonBody	..} Ö
,
..Ö Ü
headers
..á é
:
..é è
_header
..ê ó
)
..ó ò
;
..ò ô
if// 
(// 
	resultSvc// 
.// 
IsNullOrEmpty// '
(//' (
)//( )
)//) *
{00 
return11 
null11 
;11 
}22 
var33 
result33 
=33 
	resultSvc33 "
.33" #
ContentResult33# 0
.330 1
Deserialize331 <
<33< =
	GHNResult33= F
<33F G
OrderRespone33G S
>33S T
>33T U
(33U V
)33V W
;33W X
return44 
result44 
?44 
.44 
data44 
;44  
}55 	
public<< 
async<< 
Task<< 
<<< 
OrderRespone<< &
><<& '
PreviewOrderAsync<<( 9
(<<9 :
OrderRequest<<: F
request<<G N
)<<N O
{== 	
if>> 
(>> 
_header>> 
==>> 
null>> 
)>>  
_header>>! (
=>>) *
new>>+ .

Dictionary>>/ 9
<>>9 :
string>>: @
,>>@ A
string>>B H
>>>H I
(>>I J
)>>J K
;>>K L
_header?? 
.?? 
Add?? 
(?? 
$str??  
,??  !
$"??" $
{??$ %
_ghnSettings??% 1
.??1 2
ShopId??2 8
}??8 9
"??9 :
)??: ;
;??; <
var@@ 
jsonBody@@ 
=@@ 
request@@ "
;@@" #
varAA 
	resultSvcAA 
=AA 
awaitAA !
StandardHttpClientAA" 4
.AA4 5 
DoPostOrPutJsonAsyncAA5 I
(AAI J
$"AAJ L
{AAL M
_ghnSettingsAAM Y
.AAY Z
ApiPreviewOrderAAZ i
}AAi j
"AAj k
,AAk l

HttpMethodAAm w
.AAw x
PostAAx |
,AA| }
jsonBody	AA~ Ü
,
AAÜ á
headers
AAà è
:
AAè ê
_header
AAë ò
)
AAò ô
;
AAô ö
ifBB 
(BB 
	resultSvcBB 
.BB 
IsNullOrEmptyBB '
(BB' (
)BB( )
)BB) *
{CC 
returnDD 
nullDD 
;DD 
}EE 
varFF 
resultFF 
=FF 
	resultSvcFF "
.FF" #
ContentResultFF# 0
.FF0 1
DeserializeFF1 <
<FF< =
	GHNResultFF= F
<FFF G
OrderResponeFFG S
>FFS T
>FFT U
(FFU V
)FFV W
;FFW X
returnGG 
resultGG 
?GG 
.GG 
dataGG 
;GG  
}HH 	
publicOO 
asyncOO 
TaskOO 
<OO 
OrderResponeOO &
>OO& '
UpdateOrderAsyncOO( 8
(OO8 9
OrderRequestOO9 E
requestOOF M
)OOM N
{PP 	
ifQQ 
(QQ 
_headerQQ 
==QQ 
nullQQ 
)QQ  
_headerQQ! (
=QQ) *
newQQ+ .

DictionaryQQ/ 9
<QQ9 :
stringQQ: @
,QQ@ A
stringQQB H
>QQH I
(QQI J
)QQJ K
;QQK L
_headerRR 
.RR 
AddRR 
(RR 
$strRR  
,RR  !
$"RR" $
{RR$ %
_ghnSettingsRR% 1
.RR1 2
ShopIdRR2 8
}RR8 9
"RR9 :
)RR: ;
;RR; <
varSS 
jsonBodySS 
=SS 
requestSS "
;SS" #
varTT 
	resultSvcTT 
=TT 
awaitTT !
StandardHttpClientTT" 4
.TT4 5 
DoPostOrPutJsonAsyncTT5 I
(TTI J
$"TTJ L
{TTL M
_ghnSettingsTTM Y
.TTY Z
ApiUpdateOrderTTZ h
}TTh i
"TTi j
,TTj k

HttpMethodTTl v
.TTv w
PostTTw {
,TT{ |
jsonBody	TT} Ö
,
TTÖ Ü
headers
TTá é
:
TTé è
_header
TTê ó
)
TTó ò
;
TTò ô
ifUU 
(UU 
	resultSvcUU 
.UU 
IsNullOrEmptyUU '
(UU' (
)UU( )
)UU) *
{VV 
returnWW 
nullWW 
;WW 
}XX 
varYY 
resultYY 
=YY 
	resultSvcYY "
.YY" #
ContentResultYY# 0
.YY0 1
DeserializeYY1 <
<YY< =
	GHNResultYY= F
<YYF G
OrderResponeYYG S
>YYS T
>YYT U
(YYU V
)YYV W
;YYW X
returnZZ 
resultZZ 
?ZZ 
.ZZ 
dataZZ 
;ZZ  
}[[ 	
publicbb 
asyncbb 
Taskbb 
<bb 
	OrderInfobb #
>bb# $
GetOrderInfobb% 1
(bb1 2
stringbb2 8
	orderCodebb9 B
)bbB C
{cc 	
ifdd 
(dd 
_headerdd 
==dd 
nulldd 
)dd  
_headerdd! (
=dd) *
newdd+ .

Dictionarydd/ 9
<dd9 :
stringdd: @
,dd@ A
stringddB H
>ddH I
(ddI J
)ddJ K
;ddK L
varee 
jsonBodyee 
=ee 
newee 
{ff 

order_codegg 
=gg 
	orderCodegg &
}hh 
;hh 
varii 
	resultSvcii 
=ii 
awaitii !
StandardHttpClientii" 4
.ii4 5 
DoPostOrPutJsonAsyncii5 I
(iiI J
$"iiJ L
{iiL M
_ghnSettingsiiM Y
.iiY Z
ApiOrderInfoiiZ f
}iif g
"iig h
,iih i

HttpMethodiij t
.iit u
Postiiu y
,iiy z
jsonBody	ii{ É
,
iiÉ Ñ
headers
iiÖ å
:
iiå ç
_header
iié ï
)
iiï ñ
;
iiñ ó
ifjj 
(jj 
	resultSvcjj 
.jj 
IsNullOrEmptyjj '
(jj' (
)jj( )
)jj) *
{kk 
returnll 
nullll 
;ll 
}mm 
varnn 
resultnn 
=nn 
	resultSvcnn "
.nn" #
ContentResultnn# 0
.nn0 1
Deserializenn1 <
<nn< =
	GHNResultnn= F
<nnF G
	OrderInfonnG P
>nnP Q
>nnQ R
(nnR S
)nnS T
;nnT U
returnoo 
resultoo 
?oo 
.oo 
dataoo 
;oo  
}pp 	
publicww 
asyncww 
Taskww 
<ww 
boolww 
>ww 
CancelOrderAsyncww  0
(ww0 1
Listww1 5
<ww5 6
stringww6 <
>ww< =

orderCodesww> H
)wwH I
{xx 	
ifyy 
(yy 
_headeryy 
==yy 
nullyy 
)yy  
_headeryy! (
=yy) *
newyy+ .

Dictionaryyy/ 9
<yy9 :
stringyy: @
,yy@ A
stringyyB H
>yyH I
(yyI J
)yyJ K
;yyK L
_headerzz 
.zz 
Addzz 
(zz 
$strzz  
,zz  !
$"zz" $
{zz$ %
_ghnSettingszz% 1
.zz1 2
ShopIdzz2 8
}zz8 9
"zz9 :
)zz: ;
;zz; <
var{{ 
jsonBody{{ 
={{ 
new{{ 
{|| 
order_codes}} 
=}} 

orderCodes}} (
}~~ 
;~~ 
var 
	resultSvc 
= 
await !
StandardHttpClient" 4
.4 5 
DoPostOrPutJsonAsync5 I
(I J
$"J L
{L M
_ghnSettingsM Y
.Y Z
ApiCancelOrderZ h
}h i
"i j
,j k

HttpMethodl v
.v w
Postw {
,{ |
jsonBody	} Ö
,
Ö Ü
headers
á é
:
é è
_header
ê ó
)
ó ò
;
ò ô
if
ÄÄ 
(
ÄÄ 
	resultSvc
ÄÄ 
.
ÄÄ 
IsNullOrEmpty
ÄÄ '
(
ÄÄ' (
)
ÄÄ( )
)
ÄÄ) *
return
ÄÄ+ 1
false
ÄÄ2 7
;
ÄÄ7 8
var
ÅÅ 
result
ÅÅ 
=
ÅÅ 
	resultSvc
ÅÅ "
.
ÅÅ" #
ContentResult
ÅÅ# 0
.
ÅÅ0 1
Deserialize
ÅÅ1 <
<
ÅÅ< =
	GHNResult
ÅÅ= F
<
ÅÅF G 
OrderCancelRespone
ÅÅG Y
>
ÅÅY Z
>
ÅÅZ [
(
ÅÅ[ \
)
ÅÅ\ ]
;
ÅÅ] ^
if
ÇÇ 
(
ÇÇ 
result
ÇÇ 
?
ÇÇ 
.
ÇÇ 
data
ÇÇ 
!=
ÇÇ 
null
ÇÇ  $
)
ÇÇ$ %
return
ÇÇ& ,
result
ÇÇ- 3
.
ÇÇ3 4
data
ÇÇ4 8
.
ÇÇ8 9
	IsSuccess
ÇÇ9 B
;
ÇÇB C
return
ÉÉ 
false
ÉÉ 
;
ÉÉ 
}
ÑÑ 	
public
ãã 
async
ãã 
Task
ãã 
<
ãã 
bool
ãã 
>
ãã %
DeliveryAgainOrderAsync
ãã  7
(
ãã7 8
List
ãã8 <
<
ãã< =
string
ãã= C
>
ããC D

orderCodes
ããE O
)
ããO P
{
åå 	
if
çç 
(
çç 
_header
çç 
==
çç 
null
çç 
)
çç  
_header
çç! (
=
çç) *
new
çç+ .

Dictionary
çç/ 9
<
çç9 :
string
çç: @
,
çç@ A
string
ççB H
>
ççH I
(
ççI J
)
ççJ K
;
ççK L
_header
éé 
.
éé 
Add
éé 
(
éé 
$str
éé  
,
éé  !
$"
éé" $
{
éé$ %
_ghnSettings
éé% 1
.
éé1 2
ShopId
éé2 8
}
éé8 9
"
éé9 :
)
éé: ;
;
éé; <
var
èè 
jsonBody
èè 
=
èè 
new
èè 
{
êê 
order_codes
ëë 
=
ëë 

orderCodes
ëë (
}
íí 
;
íí 
var
ìì 
	resultSvc
ìì 
=
ìì 
await
ìì ! 
StandardHttpClient
ìì" 4
.
ìì4 5"
DoPostOrPutJsonAsync
ìì5 I
(
ììI J
$"
ììJ L
{
ììL M
_ghnSettings
ììM Y
.
ììY Z
ApiDeliveryAgain
ììZ j
}
ììj k
"
ììk l
,
ììl m

HttpMethod
ììn x
.
ììx y
Post
ììy }
,
ìì} ~
jsonBodyìì á
,ììá à
headersììâ ê
:ììê ë
_headerììí ô
)ììô ö
;ììö õ
if
îî 
(
îî 
	resultSvc
îî 
.
îî 
IsNullOrEmpty
îî '
(
îî' (
)
îî( )
)
îî) *
return
îî+ 1
false
îî2 7
;
îî7 8
var
ïï 
result
ïï 
=
ïï 
	resultSvc
ïï "
.
ïï" #
ContentResult
ïï# 0
.
ïï0 1
Deserialize
ïï1 <
<
ïï< =
	GHNResult
ïï= F
<
ïïF G 
OrderCancelRespone
ïïG Y
>
ïïY Z
>
ïïZ [
(
ïï[ \
)
ïï\ ]
;
ïï] ^
if
ññ 
(
ññ 
result
ññ 
?
ññ 
.
ññ 
data
ññ 
!=
ññ 
null
ññ  $
)
ññ$ %
return
ññ& ,
result
ññ- 3
.
ññ3 4
data
ññ4 8
.
ññ8 9
	IsSuccess
ññ9 B
;
ññB C
return
óó 
false
óó 
;
óó 
}
òò 	
public
°° 
async
°° 
Task
°° 
<
°° 
bool
°° 
>
°° !
UpdateCODOrderAsync
°°  3
(
°°3 4
string
°°4 :
	orderCode
°°; D
,
°°D E
int
°°F I
	codAmount
°°J S
)
°°S T
{
¢¢ 	
if
££ 
(
££ 
_header
££ 
==
££ 
null
££ 
)
££  
_header
££! (
=
££) *
new
££+ .

Dictionary
££/ 9
<
££9 :
string
££: @
,
££@ A
string
££B H
>
££H I
(
££I J
)
££J K
;
££K L
var
§§ 
jsonBody
§§ 
=
§§ 
new
§§ 
{
•• 

order_code
¶¶ 
=
¶¶ 
	orderCode
¶¶ &
,
¶¶& '

cod_amount
ßß 
=
ßß 
	codAmount
ßß &
}
®® 
;
®® 
var
©© 
	resultSvc
©© 
=
©© 
await
©© ! 
StandardHttpClient
©©" 4
.
©©4 5"
DoPostOrPutJsonAsync
©©5 I
(
©©I J
$"
©©J L
{
©©L M
_ghnSettings
©©M Y
.
©©Y Z
ApiUpdateCOD
©©Z f
}
©©f g
"
©©g h
,
©©h i

HttpMethod
©©j t
.
©©t u
Post
©©u y
,
©©y z
jsonBody©©{ É
,©©É Ñ
headers©©Ö å
:©©å ç
_header©©é ï
)©©ï ñ
;©©ñ ó
if
™™ 
(
™™ 
	resultSvc
™™ 
.
™™ 
IsNullOrEmpty
™™ '
(
™™' (
)
™™( )
)
™™) *
return
™™+ 1
false
™™2 7
;
™™7 8
var
´´ 
result
´´ 
=
´´ 
	resultSvc
´´ "
.
´´" #
ContentResult
´´# 0
.
´´0 1
Deserialize
´´1 <
<
´´< =
	GHNResult
´´= F
<
´´F G
object
´´G M
>
´´M N
>
´´N O
(
´´O P
)
´´P Q
;
´´Q R
return
¨¨ 
result
¨¨ 
.
¨¨ 
IsSuccessCode
¨¨ '
;
¨¨' (
}
≠≠ 	
public
¥¥ 
async
¥¥ 
Task
¥¥ 
<
¥¥ 
LeadTimeRespone
¥¥ )
>
¥¥) *"
GetLeadTimeInfoAsync
¥¥+ ?
(
¥¥? @
LeadTimeRequest
¥¥@ O
request
¥¥P W
)
¥¥W X
{
µµ 	
if
∂∂ 
(
∂∂ 
_header
∂∂ 
==
∂∂ 
null
∂∂ 
)
∂∂  
_header
∂∂! (
=
∂∂) *
new
∂∂+ .

Dictionary
∂∂/ 9
<
∂∂9 :
string
∂∂: @
,
∂∂@ A
string
∂∂B H
>
∂∂H I
(
∂∂I J
)
∂∂J K
;
∂∂K L
var
∑∑ 
jsonBody
∑∑ 
=
∑∑ 
new
∑∑ 
{
∏∏ 
from_district_id
ππ  
=
ππ! "
request
ππ# *
.
ππ* +
FromDistrictId
ππ+ 9
,
ππ9 :
from_ward_code
∫∫ 
=
∫∫  
request
∫∫! (
.
∫∫( )
FromDistrictId
∫∫) 7
,
∫∫7 8
to_district_id
ªª 
=
ªª  
request
ªª! (
.
ªª( )
ToDistrictId
ªª) 5
,
ªª5 6
to_ward_code
ºº 
=
ºº 
request
ºº &
.
ºº& '

ToWardCode
ºº' 1
,
ºº1 2

service_id
ΩΩ 
=
ΩΩ 
request
ΩΩ $
.
ΩΩ$ %
	ServiceId
ΩΩ% .
,
ΩΩ. /
}
ææ 
;
ææ 
var
øø 
	resultSvc
øø 
=
øø 
await
øø ! 
StandardHttpClient
øø" 4
.
øø4 5"
DoPostOrPutJsonAsync
øø5 I
(
øøI J
$"
øøJ L
{
øøL M
_ghnSettings
øøM Y
.
øøY Z
ApiLeadTime
øøZ e
}
øøe f
"
øøf g
,
øøg h

HttpMethod
øøi s
.
øøs t
Post
øøt x
,
øøx y
jsonBodyøøz Ç
,øøÇ É
headersøøÑ ã
:øøã å
_headerøøç î
)øøî ï
;øøï ñ
if
¿¿ 
(
¿¿ 
	resultSvc
¿¿ 
.
¿¿ 
IsNullOrEmpty
¿¿ '
(
¿¿' (
)
¿¿( )
)
¿¿) *
return
¿¿+ 1
null
¿¿2 6
;
¿¿6 7
var
¡¡ 
result
¡¡ 
=
¡¡ 
	resultSvc
¡¡ "
.
¡¡" #
ContentResult
¡¡# 0
.
¡¡0 1
Deserialize
¡¡1 <
<
¡¡< =
	GHNResult
¡¡= F
<
¡¡F G
LeadTimeRespone
¡¡G V
>
¡¡V W
>
¡¡W X
(
¡¡X Y
)
¡¡Y Z
;
¡¡Z [
return
¬¬ 
result
¬¬ 
.
¬¬ 
IsSuccessCode
¬¬ '
?
¬¬( )
result
¬¬* 0
.
¬¬0 1
data
¬¬1 5
:
¬¬6 7
null
¬¬8 <
;
¬¬< =
}
√√ 	
public
∆∆ 
Task
∆∆ 
ShippingFeeOrder
∆∆ $
(
∆∆$ %
)
∆∆% &
{
«« 	
throw
»» 
new
»» %
NotImplementedException
»» -
(
»»- .
)
»». /
;
»»/ 0
}
…… 	
public
œœ 
async
œœ 
Task
œœ 
<
œœ 
List
œœ 
<
œœ 
Province
œœ '
>
œœ' (
>
œœ( )
GetProvinces
œœ* 6
(
œœ6 7
)
œœ7 8
{
–– 	
var
—— 
	resultSvc
—— 
=
—— 
await
—— ! 
StandardHttpClient
——" 4
.
——4 5
GetAsync
——5 =
(
——= >
$"
——> @
{
——@ A
_ghnSettings
——A M
.
——M N
ApiProvince
——N Y
}
——Y Z
"
——Z [
,
——[ \
headers
——] d
:
——d e
_header
——f m
)
——m n
;
——n o
if
““ 
(
““ 
	resultSvc
““ 
.
““ 
IsNullOrEmpty
““ '
(
““' (
)
““( )
)
““) *
{
”” 
return
‘‘ 
null
‘‘ 
;
‘‘ 
}
’’ 
var
◊◊ 
provinceResult
◊◊ 
=
◊◊  
	resultSvc
◊◊! *
.
◊◊* +
ContentResult
◊◊+ 8
.
◊◊8 9
Deserialize
◊◊9 D
<
◊◊D E
	GHNResult
◊◊E N
<
◊◊N O
List
◊◊O S
<
◊◊S T
Province
◊◊T \
>
◊◊\ ]
>
◊◊] ^
>
◊◊^ _
(
◊◊_ `
)
◊◊` a
;
◊◊a b
if
ÿÿ 
(
ÿÿ 
provinceResult
ÿÿ 
?
ÿÿ 
.
ÿÿ  
data
ÿÿ  $
?
ÿÿ$ %
.
ÿÿ% &
Count
ÿÿ& +
>
ÿÿ, -
$num
ÿÿ. /
)
ÿÿ/ 0
{
ŸŸ 
return
⁄⁄ 
provinceResult
⁄⁄ %
.
⁄⁄% &
data
⁄⁄& *
;
⁄⁄* +
}
€€ 
return
‹‹ 
null
‹‹ 
;
‹‹ 
}
›› 	
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
List
„„ 
<
„„ 
District
„„ '
>
„„' (
>
„„( )
GetDistricts
„„* 6
(
„„6 7
)
„„7 8
{
‰‰ 	
var
ÂÂ 
	resultSvc
ÂÂ 
=
ÂÂ 
await
ÂÂ ! 
StandardHttpClient
ÂÂ" 4
.
ÂÂ4 5
GetAsync
ÂÂ5 =
(
ÂÂ= >
$"
ÂÂ> @
{
ÂÂ@ A
_ghnSettings
ÂÂA M
.
ÂÂM N
ApiDistrict
ÂÂN Y
}
ÂÂY Z
"
ÂÂZ [
,
ÂÂ[ \
headers
ÂÂ] d
:
ÂÂd e
_header
ÂÂf m
)
ÂÂm n
;
ÂÂn o
if
ÊÊ 
(
ÊÊ 
	resultSvc
ÊÊ 
.
ÊÊ 
IsNullOrEmpty
ÊÊ '
(
ÊÊ' (
)
ÊÊ( )
)
ÊÊ) *
{
ÁÁ 
return
ËË 
null
ËË 
;
ËË 
}
ÈÈ 
var
ÎÎ 
districtResult
ÎÎ 
=
ÎÎ  
	resultSvc
ÎÎ! *
.
ÎÎ* +
ContentResult
ÎÎ+ 8
.
ÎÎ8 9
Deserialize
ÎÎ9 D
<
ÎÎD E
	GHNResult
ÎÎE N
<
ÎÎN O
List
ÎÎO S
<
ÎÎS T
District
ÎÎT \
>
ÎÎ\ ]
>
ÎÎ] ^
>
ÎÎ^ _
(
ÎÎ_ `
)
ÎÎ` a
;
ÎÎa b
if
ÏÏ 
(
ÏÏ 
districtResult
ÏÏ 
?
ÏÏ 
.
ÏÏ  
data
ÏÏ  $
?
ÏÏ$ %
.
ÏÏ% &
Count
ÏÏ& +
>
ÏÏ, -
$num
ÏÏ. /
)
ÏÏ/ 0
{
ÌÌ 
return
ÓÓ 
districtResult
ÓÓ %
.
ÓÓ% &
data
ÓÓ& *
;
ÓÓ* +
}
ÔÔ 
return
 
null
 
;
 
}
ÒÒ 	
public
¯¯ 
async
¯¯ 
Task
¯¯ 
<
¯¯ 
List
¯¯ 
<
¯¯ 
District
¯¯ '
>
¯¯' (
>
¯¯( )
GetDistricts
¯¯* 6
(
¯¯6 7
int
¯¯7 :

provinceId
¯¯; E
)
¯¯E F
{
˘˘ 	
var
˙˙ 
jsonBody
˙˙ 
=
˙˙ 
new
˙˙ 
{
˚˚ 
province_id
¸¸ 
=
¸¸ 

provinceId
¸¸ (
}
˝˝ 
;
˝˝ 
var
˛˛ 
	resultSvc
˛˛ 
=
˛˛ 
await
˛˛ ! 
StandardHttpClient
˛˛" 4
.
˛˛4 5"
DoPostOrPutJsonAsync
˛˛5 I
(
˛˛I J
$"
˛˛J L
{
˛˛L M
_ghnSettings
˛˛M Y
.
˛˛Y Z
ApiDistrict
˛˛Z e
}
˛˛e f
"
˛˛f g
,
˛˛g h

HttpMethod
˛˛i s
.
˛˛s t
Post
˛˛t x
,
˛˛x y
jsonBody˛˛z Ç
,˛˛Ç É
headers˛˛Ñ ã
:˛˛ã å
_header˛˛ç î
)˛˛î ï
;˛˛ï ñ
if
ˇˇ 
(
ˇˇ 
	resultSvc
ˇˇ 
.
ˇˇ 
IsNullOrEmpty
ˇˇ '
(
ˇˇ' (
)
ˇˇ( )
)
ˇˇ) *
{
ÄÄ 
return
ÅÅ 
null
ÅÅ 
;
ÅÅ 
}
ÇÇ 
var
ÑÑ 
districtResult
ÑÑ 
=
ÑÑ  
	resultSvc
ÑÑ! *
.
ÑÑ* +
ContentResult
ÑÑ+ 8
.
ÑÑ8 9
Deserialize
ÑÑ9 D
<
ÑÑD E
	GHNResult
ÑÑE N
<
ÑÑN O
List
ÑÑO S
<
ÑÑS T
District
ÑÑT \
>
ÑÑ\ ]
>
ÑÑ] ^
>
ÑÑ^ _
(
ÑÑ_ `
)
ÑÑ` a
;
ÑÑa b
if
ÖÖ 
(
ÖÖ 
districtResult
ÖÖ 
?
ÖÖ 
.
ÖÖ  
data
ÖÖ  $
?
ÖÖ$ %
.
ÖÖ% &
Count
ÖÖ& +
>
ÖÖ, -
$num
ÖÖ. /
)
ÖÖ/ 0
{
ÜÜ 
return
áá 
districtResult
áá %
.
áá% &
data
áá& *
;
áá* +
}
àà 
return
ââ 
null
ââ 
;
ââ 
}
ää 	
public
íí 
async
íí 
Task
íí 
<
íí 
List
íí 
<
íí 
Ward
íí #
>
íí# $
>
íí$ %
GetWards
íí& .
(
íí. /
int
íí/ 2

districtId
íí3 =
)
íí= >
{
ìì 	
var
îî 
jsonBody
îî 
=
îî 
new
îî 
{
ïï 
district_id
ññ 
=
ññ 

districtId
ññ (
}
óó 
;
óó 
var
òò 
	resultSvc
òò 
=
òò 
await
òò ! 
StandardHttpClient
òò" 4
.
òò4 5"
DoPostOrPutJsonAsync
òò5 I
(
òòI J
$"
òòJ L
{
òòL M
_ghnSettings
òòM Y
.
òòY Z
ApiWard
òòZ a
}
òòa b
"
òòb c
,
òòc d

HttpMethod
òòe o
.
òòo p
Post
òòp t
,
òòt u
jsonBody
òòv ~
,
òò~ 
headersòòÄ á
:òòá à
_headeròòâ ê
)òòê ë
;òòë í
if
ôô 
(
ôô 
	resultSvc
ôô 
.
ôô 
IsNullOrEmpty
ôô '
(
ôô' (
)
ôô( )
)
ôô) *
{
öö 
return
õõ 
null
õõ 
;
õõ 
}
úú 
var
ûû 

wardResult
ûû 
=
ûû 
	resultSvc
ûû &
.
ûû& '
ContentResult
ûû' 4
.
ûû4 5
Deserialize
ûû5 @
<
ûû@ A
	GHNResult
ûûA J
<
ûûJ K
List
ûûK O
<
ûûO P
Ward
ûûP T
>
ûûT U
>
ûûU V
>
ûûV W
(
ûûW X
)
ûûX Y
;
ûûY Z
if
üü 
(
üü 

wardResult
üü 
?
üü 
.
üü 
data
üü  
?
üü  !
.
üü! "
Count
üü" '
>
üü( )
$num
üü* +
)
üü+ ,
{
†† 
return
°° 

wardResult
°° !
.
°°! "
data
°°" &
;
°°& '
}
¢¢ 
return
££ 
null
££ 
;
££ 
}
§§ 	
public
¶¶ 
async
¶¶ 
Task
¶¶ 
<
¶¶ 
bool
¶¶ 
>
¶¶ 
PrintOrderAsync
¶¶  /
(
¶¶/ 0
)
¶¶0 1
{
ßß 	
return
®® 
false
®® 
;
®® 
}
©© 	
public
´´ 
async
´´ 
Task
´´ 
<
´´ 
FeeInfo
´´ !
>
´´! "
GetFeeInfoAsync
´´# 2
(
´´2 3
FeeInfoRequest
´´3 A
request
´´B I
)
´´I J
{
¨¨ 	
var
≠≠ 
jsonBody
≠≠ 
=
≠≠ 
new
≠≠ 
{
ÆÆ 
shop_id
ØØ 
=
ØØ 
	storeInfo
ØØ #
.
ØØ# $
shop_id
ØØ$ +
,
ØØ+ ,
service_type_id
∞∞ 
=
∞∞  !
$num
∞∞" #
,
∞∞# $
from_district_id
±±  
=
±±! "
	storeInfo
±±# ,
.
±±, -
district_id
±±- 8
,
±±8 9
to_ward_code
≤≤ 
=
≤≤ 
request
≤≤ &
.
≤≤& '
to_ward_code
≤≤' 3
,
≤≤3 4
to_district_id
≥≥ 
=
≥≥  
request
≥≥! (
.
≥≥( )
to_district_id
≥≥) 7
,
≥≥7 8
weight
¥¥ 
=
¥¥ 
request
¥¥  
.
¥¥  !
weight
¥¥! '
,
¥¥' (
length
µµ 
=
µµ 
request
µµ  
.
µµ  !
length
µµ! '
,
µµ' (
width
∂∂ 
=
∂∂ 
request
∂∂ 
.
∂∂  
width
∂∂  %
,
∂∂% &
height
∑∑ 
=
∑∑ 
request
∑∑  
.
∑∑  !
height
∑∑! '
,
∑∑' (
	cod_value
∏∏ 
=
∏∏ 
request
∏∏ #
.
∏∏# $
	cod_value
∏∏$ -
}
ππ 
;
ππ 
var
∫∫ 
	resultSvc
∫∫ 
=
∫∫ 
await
∫∫ ! 
StandardHttpClient
∫∫" 4
.
∫∫4 5"
DoPostOrPutJsonAsync
∫∫5 I
(
∫∫I J
$"
∫∫J L
{
∫∫L M
_ghnSettings
∫∫M Y
.
∫∫Y Z
ApiFee
∫∫Z `
}
∫∫` a
"
∫∫a b
,
∫∫b c

HttpMethod
∫∫d n
.
∫∫n o
Post
∫∫o s
,
∫∫s t
jsonBody
∫∫u }
,
∫∫} ~
headers∫∫ Ü
:∫∫Ü á
_header∫∫à è
)∫∫è ê
;∫∫ê ë
if
ªª 
(
ªª 
	resultSvc
ªª 
.
ªª 
IsNullOrEmpty
ªª '
(
ªª' (
)
ªª( )
)
ªª) *
return
ªª+ 1
null
ªª2 6
;
ªª6 7
var
ΩΩ 
	feeResult
ΩΩ 
=
ΩΩ 
	resultSvc
ΩΩ %
.
ΩΩ% &
ContentResult
ΩΩ& 3
.
ΩΩ3 4
Deserialize
ΩΩ4 ?
<
ΩΩ? @
	GHNResult
ΩΩ@ I
<
ΩΩI J
FeeInfo
ΩΩJ Q
>
ΩΩQ R
>
ΩΩR S
(
ΩΩS T
)
ΩΩT U
;
ΩΩU V
if
ææ 
(
ææ 
	feeResult
ææ 
?
ææ 
.
ææ 
data
ææ 
!=
ææ  "
null
ææ# '
)
ææ' (
{
øø 
return
¿¿ 
	feeResult
¿¿  
.
¿¿  !
data
¿¿! %
;
¿¿% &
}
¡¡ 
return
¬¬ 
null
¬¬ 
;
¬¬ 
}
√√ 	
public
ƒƒ 
async
ƒƒ 
Task
ƒƒ 
<
ƒƒ 
LeadTimeInfo
ƒƒ &
>
ƒƒ& '#
GetLeadTimeOrderAsync
ƒƒ( =
(
ƒƒ= >"
LeadTimeOrderRequest
ƒƒ> R
request
ƒƒS Z
)
ƒƒZ [
{
≈≈ 	
var
∆∆ 
jsonBody
∆∆ 
=
∆∆ 
new
∆∆ 
{
«« 
shop_id
»» 
=
»» 
	storeInfo
»» #
.
»»# $
shop_id
»»$ +
,
»»+ ,
from_district_id
……  
=
……! "
	storeInfo
……# ,
.
……, -
district_id
……- 8
,
……8 9
from_ward_code
   
=
    
	storeInfo
  ! *
.
  * +
	ward_code
  + 4
,
  4 5
to_ward_code
ÀÀ 
=
ÀÀ 
request
ÀÀ &
.
ÀÀ& '
to_ward_code
ÀÀ' 3
,
ÀÀ3 4
to_district_id
ÃÃ 
=
ÃÃ  
request
ÃÃ! (
.
ÃÃ( )
to_district_id
ÃÃ) 7
,
ÃÃ7 8

service_id
ÕÕ 
=
ÕÕ 
$num
ÕÕ !
}
ŒŒ 
;
ŒŒ 
var
œœ 
	resultSvc
œœ 
=
œœ 
await
œœ ! 
StandardHttpClient
œœ" 4
.
œœ4 5"
DoPostOrPutJsonAsync
œœ5 I
(
œœI J
$"
œœJ L
{
œœL M
_ghnSettings
œœM Y
.
œœY Z
ApiLeadTime
œœZ e
}
œœe f
"
œœf g
,
œœg h

HttpMethod
œœi s
.
œœs t
Post
œœt x
,
œœx y
jsonBodyœœz Ç
,œœÇ É
headersœœÑ ã
:œœã å
_headerœœç î
)œœî ï
;œœï ñ
if
–– 
(
–– 
	resultSvc
–– 
.
–– 
IsNullOrEmpty
–– '
(
––' (
)
––( )
)
––) *
return
––+ 1
null
––2 6
;
––6 7
var
““ 
	feeResult
““ 
=
““ 
	resultSvc
““ %
.
““% &
ContentResult
““& 3
.
““3 4
Deserialize
““4 ?
<
““? @
	GHNResult
““@ I
<
““I J
LeadTimeInfo
““J V
>
““V W
>
““W X
(
““X Y
)
““Y Z
;
““Z [
if
”” 
(
”” 
	feeResult
”” 
?
”” 
.
”” 
data
”” 
!=
””  "
null
””# '
)
””' (
{
‘‘ 
return
’’ 
	feeResult
’’  
.
’’  !
data
’’! %
;
’’% &
}
÷÷ 
return
◊◊ 
null
◊◊ 
;
◊◊ 
}
ÿÿ 	
}
‹‹ 
}›› »
jC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\GHN\IGHNClient.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
.% &
GHN& )
{		 
public

 

	interface

 

IGHNClient

 
{ 
Task 
ShippingFeeOrder 
( 
) 
;  
Task 
< 
	OrderInfo 
> 
GetOrderInfo $
($ %
string% +
	orderCode, 5
)5 6
;6 7
Task 
< 
OrderRespone 
> 
CreateOrderAsync +
(+ ,
OrderRequest, 8
request9 @
)@ A
;A B
Task%% 
<%% 
OrderRespone%% 
>%% 
UpdateOrderAsync%% +
(%%+ ,
OrderRequest%%, 8
request%%9 @
)%%@ A
;%%A B
Task,, 
<,, 
bool,, 
>,, 
CancelOrderAsync,, #
(,,# $
List,,$ (
<,,( )
string,,) /
>,,/ 0

orderCodes,,1 ;
),,; <
;,,< =
Task33 
<33 
bool33 
>33 #
DeliveryAgainOrderAsync33 *
(33* +
List33+ /
<33/ 0
string330 6
>336 7

orderCodes338 B
)33B C
;33C D
Task<< 
<<< 
bool<< 
><< 
UpdateCODOrderAsync<< &
(<<& '
string<<' -
	orderCode<<. 7
,<<7 8
int<<9 <
	codAmount<<= F
)<<F G
;<<G H
TaskDD 
<DD 
LeadTimeResponeDD 
>DD  
GetLeadTimeInfoAsyncDD 2
(DD2 3
LeadTimeRequestDD3 B
requestDDC J
)DDJ K
;DDK L
TaskLL 
<LL 
OrderResponeLL 
>LL 
PreviewOrderAsyncLL ,
(LL, -
OrderRequestLL- 9
requestLL: A
)LLA B
;LLB C
TaskNN 
<NN 
FeeInfoNN 
>NN 
GetFeeInfoAsyncNN %
(NN% &
FeeInfoRequestNN& 4
requestNN5 <
)NN< =
;NN= >
TaskUU 
<UU 
LeadTimeInfoUU 
>UU !
GetLeadTimeOrderAsyncUU 0
(UU0 1 
LeadTimeOrderRequestUU1 E
requestUUF M
)UUM N
;UUN O
Task^^ 
<^^ 
List^^ 
<^^ 
Province^^ 
>^^ 
>^^ 
GetProvinces^^ )
(^^) *
)^^* +
;^^+ ,
Taskcc 
<cc 
Listcc 
<cc 
Districtcc 
>cc 
>cc 
GetDistrictscc )
(cc) *
)cc* +
;cc+ ,
Taskjj 
<jj 
Listjj 
<jj 
Districtjj 
>jj 
>jj 
GetDistrictsjj )
(jj) *
intjj* -

provinceIdjj. 8
)jj8 9
;jj9 :
Taskqq 
<qq 
Listqq 
<qq 
Wardqq 
>qq 
>qq 
GetWardsqq !
(qq! "
intqq" %

districtIdqq& 0
)qq0 1
;qq1 2
}tt 
}uu ø
lC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Momo\IMomoClient.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
.% &
Momo& *
{		 
public

 

	interface

 
IMomoClient

  
{ 
Task 
< 
bool 
> 
PaymentMomoAsync #
(# $
PaymentRequest$ 2
request3 :
): ;
;; <
} 
} ÆJ
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Momo\MomoClient.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
.% &
Momo& *
{ 
public 

class 

MomoClient 
: 
IMomoClient )
{ 
private 
readonly 
MomoSettings %
_momoSettings& 3
;3 4
public 

MomoClient 
( 
) 
{ 	
_momoSettings 
= 
new 
MomoSettings  ,
(, -
)- .
;. /
} 	
public 
async 
Task 
< 
bool 
> 
PaymentMomoAsync  0
(0 1
PaymentRequest1 ?
request@ G
)G H
{ 	
var 
	serectkey 
= 
_momoSettings )
.) *
	AccessKey* 3
;3 4
request 
= 
new 
PaymentRequest (
{ 
PartnerCode 
= 
_momoSettings +
.+ ,
PartnerCode, 7
,7 8
Amount 
= 
$num 
,  
	ExtraData 
= 
$str 
, 
IpnUrl 
= 
$str *
,* +
OrderId   
=   
$"   
{   
Guid   !
.  ! "
NewGuid  " )
(  ) *
)  * +
}  + ,
"  , -
,  - .
	OrderInfo!! 
=!! 
$str!! .
,!!. /
RedirectUrl"" 
="" 
$str"" /
,""/ 0
	RequestId## 
=## 
$"## 
{## 
Guid## #
.### $
NewGuid##$ +
(##+ ,
)##, -
}##- .
"##. /
,##/ 0
RequestType$$ 
=$$ 
$"$$  
$str$$  -
"$$- .
,$$. /
Lang%% 
=%% 
$str%% 
}&& 
;&& 
var** 
rawHash** 
=** 
$str** &
+**' (
	serectkey**) 2
+**3 4
$str**5 ?
+**@ A
request**B I
.**I J
Amount**J P
+**Q R
$str**S `
+**a b
request**c j
.**j k
	ExtraData**k t
+**u v
$str	**w Å
+
**Ç É
request
**Ñ ã
.
**ã å
IpnUrl
**å í
+
**ì î
$str
**ï †
+
**° ¢
request
**£ ™
.
**™ ´
OrderId
**´ ≤
+++ 
$str++ 
+++  !
request++" )
.++) *
	OrderInfo++* 3
+++4 5
$str++6 E
+++F G
request++H O
.++O P
PartnerCode++P [
+++\ ]
$str++^ m
+++n o
request++p w
.++w x
RedirectUrl	++x É
+
++Ñ Ö
$str
++Ü ì
+
++î ï
request
++ñ ù
.
++ù û
	RequestId
++û ß
+
++® ©
$str
++™ π
+
++∫ ª
request
++º √
.
++√ ƒ
RequestType
++ƒ œ
;
++œ –
MoMoSecurity-- 
crypto-- 
=--  !
new--" %
MoMoSecurity--& 2
(--2 3
)--3 4
;--4 5
string// 
	signature// 
=// 
crypto// %
.//% &

SignSHA256//& 0
(//0 1
rawHash//1 8
,//8 9
	serectkey//: C
)//C D
;//D E
JObject00 
message00 
=00 
new00 !
JObject00" )
{11 
{22 
$str22 
,22  
request22! (
.22( )
PartnerCode22) 4
}225 6
,226 7
{33 
$str33 
,33  
$str33! '
}33( )
,33) *
{44 
$str44 
,44 
request44 $
.44$ %
PartnerCode44% 0
}441 2
,442 3
{55 
$str55 
,55  
request55! (
.55( )
RequestType55) 4
}555 6
,556 7
{66 
$str66 
,66 
request66 #
.66# $
	OrderInfo66$ -
}66. /
,66/ 0
{77 
$str77 
,77  
request77! (
.77( )
RedirectUrl77) 4
}775 6
,776 7
{88 
$str88 
,88 
request88 #
.88# $
Amount88$ *
}88+ ,
,88, -
{99 
$str99 
,99 
request99 !
.99! "
Lang99" &
}99' (
,99( )
{:: 
$str:: 
,::  
false::! &
}::' (
,::( )
{;; 
$str;; 
,;; 
request;; &
.;;& '
	RequestId;;' 0
};;1 2
,;;2 3
{<< 
$str<< 
,<< 
request<< $
.<<$ %
OrderId<<% ,
}<<- .
,<<. /
{== 
$str== 
,== 
request== &
.==& '
	ExtraData==' 0
}==1 2
,==2 3
{>> 
$str>> 
,>> 
	signature>> (
}>>) *
}?? 
;?? 
string@@ 
responseFromMomo@@ #
=@@$ %
SendPaymentRequest@@& 8
(@@8 9
_momoSettings@@9 F
.@@F G

ApiEnpoint@@G Q
,@@Q R
message@@S Z
.@@Z [
ToString@@[ c
(@@c d
)@@d e
)@@e f
;@@f g
JObjectBB 
jmessageBB 
=BB 
JObjectBB &
.BB& '
ParseBB' ,
(BB, -
responseFromMomoBB- =
)BB= >
;BB> ?
returnCC 
falseCC 
;CC 
}DD 	
publicFF 
stringFF 
SendPaymentRequestFF (
(FF( )
stringFF) /
endpointFF0 8
,FF8 9
stringFF: @
postJsonStringFFA O
)FFO P
{GG 	
tryII 
{JJ 
HttpWebRequestKK 
httpWReqKK '
=KK( )
(KK* +
HttpWebRequestKK+ 9
)KK9 :

WebRequestKK: D
.KKD E
CreateKKE K
(KKK L
endpointKKL T
)KKT U
;KKU V
varMM 
postDataMM 
=MM 
postJsonStringMM -
;MM- .
varOO 
dataOO 
=OO 
EncodingOO #
.OO# $
UTF8OO$ (
.OO( )
GetBytesOO) 1
(OO1 2
postDataOO2 :
)OO: ;
;OO; <
httpWReqQQ 
.QQ 
ProtocolVersionQQ (
=QQ) *
HttpVersionQQ+ 6
.QQ6 7
	Version11QQ7 @
;QQ@ A
httpWReqRR 
.RR 
MethodRR 
=RR  !
$strRR" (
;RR( )
httpWReqSS 
.SS 
ContentTypeSS $
=SS% &
$strSS' 9
;SS9 :
httpWReqUU 
.UU 
ContentLengthUU &
=UU' (
dataUU) -
.UU- .
LengthUU. 4
;UU4 5
httpWReqVV 
.VV 
ReadWriteTimeoutVV )
=VV* +
$numVV, 1
;VV1 2
httpWReqWW 
.WW 
TimeoutWW  
=WW! "
$numWW# (
;WW( )
StreamXX 
streamXX 
=XX 
httpWReqXX  (
.XX( )
GetRequestStreamXX) 9
(XX9 :
)XX: ;
;XX; <
streamYY 
.YY 
WriteYY 
(YY 
dataYY !
,YY! "
$numYY# $
,YY$ %
dataYY& *
.YY* +
LengthYY+ 1
)YY1 2
;YY2 3
streamZZ 
.ZZ 
CloseZZ 
(ZZ 
)ZZ 
;ZZ 
HttpWebResponse\\ 
response\\  (
=\\) *
(\\+ ,
HttpWebResponse\\, ;
)\\; <
httpWReq\\< D
.\\D E
GetResponse\\E P
(\\P Q
)\\Q R
;\\R S
string^^ 
jsonresponse^^ #
=^^$ %
$str^^& (
;^^( )
using`` 
(`` 
var`` 
reader`` !
=``" #
new``$ '
StreamReader``( 4
(``4 5
response``5 =
.``= >
GetResponseStream``> O
(``O P
)``P Q
)``Q R
)``R S
{aa 
stringcc 
tempcc 
=cc  !
nullcc" &
;cc& '
whiledd 
(dd 
(dd 
tempdd  
=dd! "
readerdd# )
.dd) *
ReadLinedd* 2
(dd2 3
)dd3 4
)dd4 5
!=dd6 8
nulldd9 =
)dd= >
{ee 
jsonresponseff $
+=ff% '
tempff( ,
;ff, -
}gg 
}hh 
returnjj 
jsonresponsejj #
;jj# $
}mm 
catchnn 
(nn 
WebExceptionnn 
enn  !
)nn! "
{oo 
returnpp 
epp 
.pp 
Messagepp  
;pp  !
}qq 
}rr 	
}ss 
}tt ˛G
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\Services\Momo\MoMoSecurity.cs
	namespace 	
Web
 
. 
Infrastructure 
. 
Services %
.% &
Momo& *
{		 
class

 	
MoMoSecurity


 
{ 
private 
static $
RNGCryptoServiceProvider /
rngCsp0 6
=7 8
new9 <$
RNGCryptoServiceProvider= U
(U V
)V W
;W X
public 
MoMoSecurity 
( 
) 
{ 	
} 	
public 
string 
GetHash 
( 
string $
partnerCode% 0
,0 1
string2 8
merchantRefId9 F
,F G
string 
amount 
, 
string !
paymentCode" -
,- .
string/ 5
storeId6 =
,= >
string? E
	storeNameF O
,O P
stringQ W
publicKeyXMLX d
)d e
{ 	
string 
json 
= 
$str /
+0 1
partnerCode 
+ 
$str 6
+7 8
merchantRefId 
+ 
$str  0
+1 2
amount 
+ 
$str .
+/ 0
paymentCode 
+ 
$str 1
+2 3
storeId 
+ 
$str /
+0 1
	storeName 
+ 
$str !
;! "
byte 
[ 
] 
data 
= 
Encoding "
." #
UTF8# '
.' (
GetBytes( 0
(0 1
json1 5
)5 6
;6 7
string 
result 
= 
null  
;  !
using 
( 
var 
rsa 
= 
new  $
RSACryptoServiceProvider! 9
(9 :
$num: >
)> ?
)? @
{ 
try 
{   
rsa## 
.## 
FromXmlString## %
(##% &
publicKeyXML##& 2
)##2 3
;##3 4
var$$ 
encryptedData$$ %
=$$& '
rsa$$( +
.$$+ ,
Encrypt$$, 3
($$3 4
data$$4 8
,$$8 9
false$$: ?
)$$? @
;$$@ A
var%% 
base64Encrypted%% '
=%%( )
Convert%%* 1
.%%1 2
ToBase64String%%2 @
(%%@ A
encryptedData%%A N
)%%N O
;%%O P
result&& 
=&& 
base64Encrypted&& ,
;&&, -
}'' 
finally(( 
{)) 
rsa** 
.** 
PersistKeyInCsp** '
=**( )
false*** /
;**/ 0
}++ 
}-- 
return// 
result// 
;// 
}11 	
public22 
string22 
BuildQueryHash22 $
(22$ %
string22% +
partnerCode22, 7
,227 8
string229 ?
merchantRefId22@ M
,22M N
string33 
	requestid33 
,33 
string33 $
	publicKey33% .
)33. /
{44 	
string55 
json55 
=55 
$str55 /
+550 1
partnerCode66 
+66 
$str66 6
+667 8
merchantRefId77 
+77 
$str77  5
+776 7
	requestid88 
+88 
$str88 !
;88! "
byte:: 
[:: 
]:: 
data:: 
=:: 
Encoding:: "
.::" #
UTF8::# '
.::' (
GetBytes::( 0
(::0 1
json::1 5
)::5 6
;::6 7
string;; 
result;; 
=;; 
null;;  
;;;  !
using<< 
(<< 
var<< 
rsa<< 
=<< 
new<<  $
RSACryptoServiceProvider<<! 9
(<<9 :
$num<<: >
)<<> ?
)<<? @
{== 
try>> 
{?? 
rsaAA 
.AA 
FromXmlStringAA %
(AA% &
	publicKeyAA& /
)AA/ 0
;AA0 1
varBB 
encryptedDataBB %
=BB& '
rsaBB( +
.BB+ ,
EncryptBB, 3
(BB3 4
dataBB4 8
,BB8 9
falseBB: ?
)BB? @
;BB@ A
varCC 
base64EncryptedCC '
=CC( )
ConvertCC* 1
.CC1 2
ToBase64StringCC2 @
(CC@ A
encryptedDataCCA N
)CCN O
;CCO P
resultDD 
=DD 
base64EncryptedDD ,
;DD, -
}EE 
finallyFF 
{GG 
rsaHH 
.HH 
PersistKeyInCspHH '
=HH( )
falseHH* /
;HH/ 0
}II 
}KK 
returnMM 
resultMM 
;MM 
}OO 	
publicQQ 
stringQQ 
BuildRefundHashQQ %
(QQ% &
stringQQ& ,
partnerCodeQQ- 8
,QQ8 9
stringQQ: @
merchantRefIdQQA N
,QQN O
stringRR 

momoTranIdRR 
,RR 
longRR #
amountRR$ *
,RR* +
stringRR, 2
descriptionRR3 >
,RR> ?
stringRR@ F
	publicKeyRRG P
)RRP Q
{SS 	
stringTT 
jsonTT 
=TT 
$strTT /
+TT0 1
partnerCodeUU 
+UU 
$strUU 6
+UU7 8
merchantRefIdVV 
+VV 
$strVV  7
+VV8 9

momoTranIdWW 
+WW 
$strWW -
+WW. /
amountXX 
+XX 
$strXX .
+XX/ 0
descriptionYY 
+YY 
$strYY #
;YY# $
byte[[ 
[[[ 
][[ 
data[[ 
=[[ 
Encoding[[ "
.[[" #
UTF8[[# '
.[[' (
GetBytes[[( 0
([[0 1
json[[1 5
)[[5 6
;[[6 7
string\\ 
result\\ 
=\\ 
null\\  
;\\  !
using]] 
(]] 
var]] 
rsa]] 
=]] 
new]]  $
RSACryptoServiceProvider]]! 9
(]]9 :
$num]]: >
)]]> ?
)]]? @
{^^ 
try__ 
{`` 
rsabb 
.bb 
FromXmlStringbb %
(bb% &
	publicKeybb& /
)bb/ 0
;bb0 1
varcc 
encryptedDatacc %
=cc& '
rsacc( +
.cc+ ,
Encryptcc, 3
(cc3 4
datacc4 8
,cc8 9
falsecc: ?
)cc? @
;cc@ A
vardd 
base64Encrypteddd '
=dd( )
Convertdd* 1
.dd1 2
ToBase64Stringdd2 @
(dd@ A
encryptedDataddA N
)ddN O
;ddO P
resultee 
=ee 
base64Encryptedee ,
;ee, -
}ff 
finallygg 
{hh 
rsaii 
.ii 
PersistKeyInCspii '
=ii( )
falseii* /
;ii/ 0
}jj 
}ll 
returnnn 
resultnn 
;nn 
}pp 	
publicqq 
stringqq 

SignSHA256qq  
(qq  !
stringqq! '
messageqq( /
,qq/ 0
stringqq1 7
keyqq8 ;
)qq; <
{rr 	
bytess 
[ss 
]ss 
keyBytess 
=ss 
Encodingss %
.ss% &
UTF8ss& *
.ss* +
GetBytesss+ 3
(ss3 4
keyss4 7
)ss7 8
;ss8 9
bytett 
[tt 
]tt 
messageBytestt 
=tt  !
Encodingtt" *
.tt* +
UTF8tt+ /
.tt/ 0
GetBytestt0 8
(tt8 9
messagett9 @
)tt@ A
;ttA B
usinguu 
(uu 
varuu 

hmacsha256uu !
=uu" #
newuu$ '

HMACSHA256uu( 2
(uu2 3
keyByteuu3 :
)uu: ;
)uu; <
{vv 
byteww 
[ww 
]ww 
hashmessageww "
=ww# $

hmacsha256ww% /
.ww/ 0
ComputeHashww0 ;
(ww; <
messageBytesww< H
)wwH I
;wwI J
stringxx 
hexxx 
=xx 
BitConverterxx )
.xx) *
ToStringxx* 2
(xx2 3
hashmessagexx3 >
)xx> ?
;xx? @
hexyy 
=yy 
hexyy 
.yy 
Replaceyy !
(yy! "
$stryy" %
,yy% &
$stryy' )
)yy) *
.yy* +
ToLoweryy+ 2
(yy2 3
)yy3 4
;yy4 5
returnzz 
hexzz 
;zz 
}|| 
}}} 	
}~~ 
} b
`C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\SqlEF\SqlRepo.csΩ
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\BaseShareRepo.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public		 

class		 
BaseShareRepo		 
<		 
DQ		 !
>		! "
where		# (
DQ		) +
:		, -
class		. 3
{

 
public 
BaseShareRepo 
( 
) 
{ 	
} 	
} 
} ¥E
lC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\BaseUnitOfWork.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
BaseUnitOfWork 
<  
T  !
>! "
:# $
	BaseClass% .
<. /
T/ 0
>0 1
,1 2
IBaseUnitOfWork3 B
{ 
private 
const 
string 
TAG  
=! "
$str# 3
;3 4
private 
	IBaseRepo 
< 
User 
> 
_user  %
;% &
private 
	IBaseRepo 
< 
AddressInfo %
>% &
_address_infos' 5
;5 6
private 
	IBaseRepo 
< 
Avatar  
>  !
_avatar" )
;) *
private 
	IBaseRepo 
< 
Customer "
>" #

_customers$ .
;. /
private 
	IBaseRepo 
< 
Product !
>! "
	_products# ,
;, -
private 
	IBaseRepo 
< 
Color 
>  
_colors! (
;( )
private 
	IBaseRepo 
< 
ProductCategory )
>) *
_product_categories+ >
;> ?
private 
	IBaseRepo 
< 
Order 
>  
_orders! (
;( )
private 
	IBaseRepo 
< 
	OrderItem #
># $
_orderItems% 0
;0 1
private 
	IBaseRepo 
< 
Blog 
> 
_blogs  &
;& '
private 
	IBaseRepo 
< 
BlogCategory &
>& '
_blog_categories( 8
;8 9
private 
	IBaseRepo 
< 
Image 
>  
_images! (
;( )
private 
	IBaseRepo 
< 

Permission $
>$ %
_permissions& 2
;2 3
private 
	IBaseRepo 
< 
PermissionDetail *
>* +
_permission_details, ?
;? @
private   
	IBaseRepo   
<   "
PermissionRelationship   0
>  0 1%
_permission_relationships  2 K
;  K L
	protected"" 
readonly"" 
PostgreSqlContext"" ,

_dbContext""- 7
;""7 8
	protected## 
readonly## 
AppSettings## &
_appSettings##' 3
;##3 4
public'' 
BaseUnitOfWork'' 
('' 
IServiceProvider'' .
serviceProvider''/ >
)''> ?
:''@ A
base''B F
(''F G
serviceProvider''G V
)''V W
{(( 	
var)) 
contextOptions)) 
=))  
new))! $#
DbContextOptionsBuilder))% <
<))< =
PostgreSqlContext))= N
>))N O
())O P
)))P Q
.** 
	UseNpgsql** 
(** 
@$"** 
{** 
PostgresSettings** /
.**/ 0
ConnectionString**0 @
}**@ A
"**A B
)**B C
.++ 
Options++ 
;++ 

_dbContext,, 
=,, 
new,, 
PostgreSqlContext,, .
(,,. /
contextOptions,,/ =
),,= >
;,,> ?
_appSettings-- 
=-- 
serviceProvider-- *
.--* +
GetRequiredService--+ =
<--= >
IOptions--> F
<--F G
AppSettings--G R
>--R S
>--S T
(--T U
)--U V
.--V W
Value--W \
;--\ ]
}.. 	
public33 
	IBaseRepo33 
<33 
User33 
>33 
Users33 $
=>33% '
_user33( -
??=33. 1
new332 5
BaseRepo336 >
<33> ?
User33? C
>33C D
(33D E
)33E F
;33F G
public44 
	IBaseRepo44 
<44 
AddressInfo44 $
>44$ %
AddressInfos44& 2
=>443 5
_address_infos446 D
??=44E H
new44I L
BaseRepo44M U
<44U V
AddressInfo44V a
>44a b
(44b c
)44c d
;44d e
public55 
	IBaseRepo55 
<55 
Avatar55 
>55  
Avatars55! (
=>55) +
_avatar55, 3
??=554 7
new558 ;
BaseRepo55< D
<55D E
Avatar55E K
>55K L
(55L M
)55M N
;55N O
public66 
	IBaseRepo66 
<66 
Customer66 !
>66! "
	Customers66# ,
=>66- /

_customers660 :
??=66; >
new66? B
BaseRepo66C K
<66K L
Customer66L T
>66T U
(66U V
)66V W
;66W X
public77 
	IBaseRepo77 
<77 
Color77 
>77 
Colors77  &
=>77' )
_colors77* 1
??=772 5
new776 9
BaseRepo77: B
<77B C
Color77C H
>77H I
(77I J
)77J K
;77K L
public99 
	IBaseRepo99 
<99 
Product99  
>99  !
Products99" *
=>99+ -
	_products99. 7
??=998 ;
new99< ?
BaseRepo99@ H
<99H I
Product99I P
>99P Q
(99Q R
)99R S
;99S T
public;; 
	IBaseRepo;; 
<;; 
ProductCategory;; (
>;;( )
ProductCategories;;* ;
=>;;< >
_product_categories;;? R
??=;;S V
new;;W Z
BaseRepo;;[ c
<;;c d
ProductCategory;;d s
>;;s t
(;;t u
);;u v
;;;v w
public<< 
	IBaseRepo<< 
<<< 
Order<< 
><< 
Orders<<  &
=><<' )
_orders<<* 1
??=<<2 5
new<<6 9
BaseRepo<<: B
<<<B C
Order<<C H
><<H I
(<<I J
)<<J K
;<<K L
public== 
	IBaseRepo== 
<== 
	OrderItem== "
>==" #

OrderItems==$ .
=>==/ 1
_orderItems==2 =
??===> A
new==B E
BaseRepo==F N
<==N O
	OrderItem==O X
>==X Y
(==Y Z
)==Z [
;==[ \
public>> 
	IBaseRepo>> 
<>> 
Blog>> 
>>> 
Blogs>> $
=>>>% '
_blogs>>( .
??=>>/ 2
new>>3 6
BaseRepo>>7 ?
<>>? @
Blog>>@ D
>>>D E
(>>E F
)>>F G
;>>G H
public?? 
	IBaseRepo?? 
<?? 
BlogCategory?? %
>??% &
BlogCategories??' 5
=>??6 8
_blog_categories??9 I
??=??J M
new??N Q
BaseRepo??R Z
<??Z [
BlogCategory??[ g
>??g h
(??h i
)??i j
;??j k
public@@ 
	IBaseRepo@@ 
<@@ 
Image@@ 
>@@ 
Images@@  &
=>@@' )
_images@@* 1
??=@@2 5
new@@6 9
BaseRepo@@: B
<@@B C
Image@@C H
>@@H I
(@@I J
)@@J K
;@@K L
publicBB 
	IBaseRepoBB 
<BB 

PermissionBB #
>BB# $
PermissionsBB% 0
=>BB1 3
_permissionsBB4 @
??=BBA D
newBBE H
BaseRepoBBI Q
<BBQ R

PermissionBBR \
>BB\ ]
(BB] ^
)BB^ _
;BB_ `
publicDD 
	IBaseRepoDD 
<DD 
PermissionDetailDD )
>DD) *
PermissionDetailsDD+ <
=>DD= ?
_permission_detailsDD@ S
??=DDT W
newDDX [
BaseRepoDD\ d
<DDd e
PermissionDetailDDe u
>DDu v
(DDv w
)DDw x
;DDx y
publicFF 
	IBaseRepoFF 
<FF "
PermissionRelationshipFF /
>FF/ 0#
PermissionRelationshipsFF1 H
=>FFI K%
_permission_relationshipsFFL e
??=FFf i
newFFj m
BaseRepoFFn v
<FFv w#
PermissionRelationship	FFw ç
>
FFç é
(
FFé è
)
FFè ê
;
FFê ë
}LL 
}MM ˇ
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Blog\BlogCategoryUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
BlogCategoryUoW  
:! "
BaseUnitOfWork# 1
<1 2
BlogCategoryUoW2 A
>A B
,B C
IBlogCategoryUoWD T
{ 
public		 
BlogCategoryUoW		 
(		 
IServiceProvider		 /
serviceProvider		0 ?
)		? @
:		A B
base		C G
(		G H
serviceProvider		H W
)		W X
{

 	
} 	
} 
} ◊
jC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Blog\BlogUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
BlogUoW 
: 
BaseUnitOfWork )
<) *
BlogUoW* 1
>1 2
,2 3
IBlogUoW4 <
{ 
public		 
BlogUoW		 
(		 
IServiceProvider		 '
serviceProvider		( 7
)		7 8
:		9 :
base		; ?
(		? @
serviceProvider		A P
)		P Q
{

 	
} 	
} 
} ‹
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Blog\ImageUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
ImageUoW 
: 
BaseUnitOfWork *
<* +
ImageUoW+ 3
>3 4
,4 5
	IImageUoW6 ?
{ 
public		 
ImageUoW		 
(		 
IServiceProvider		 (
serviceProvider		) 8
)		8 9
:		: ;
base		< @
(		@ A
serviceProvider		A P
)		P Q
{

 	
} 	
} 
} k
iC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\DbShareRepo.csÒ
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Order\OrderItemUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
OrderItemUoW 
: 
BaseUnitOfWork  .
<. /
OrderItemUoW/ ;
>; <
,< =
IOrderItemUoW> K
{ 
public		 
OrderItemUoW		 
(		 
IServiceProvider		 ,
serviceProvider		- <
)		< =
:		> ?
base		@ D
(		D E
serviceProvider		E T
)		T U
{

 	
} 	
} 
} ›
lC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Order\OrderUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
OrderUoW 
: 
BaseUnitOfWork *
<* +
OrderUoW+ 3
>3 4
,4 5
	IOrderUoW6 ?
{ 
public		 
OrderUoW		 
(		 
IServiceProvider		 (
serviceProvider		) 8
)		8 9
:		: ;
base		< @
(		@ A
serviceProvider		A P
)		P Q
{

 	
} 	
} 
} ﬂ
nC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Product\ColorUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
ColorUoW 
: 
BaseUnitOfWork *
<* +
ColorUoW+ 3
>3 4
,4 5
	IColorUoW6 ?
{ 
public		 
ColorUoW		 
(		 
IServiceProvider		 (
serviceProvider		) 8
)		8 9
:		: ;
base		< @
(		@ A
serviceProvider		A P
)		P Q
{

 	
} 	
} 
} ë
xC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Product\ProductCategoryUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
ProductCategoryUoW #
:$ %
BaseUnitOfWork& 4
<4 5
ProductCategoryUoW5 G
>G H
,H I
IProductCategoryUoWJ ]
{ 
public		 
ProductCategoryUoW		 !
(		! "
IServiceProvider		" 2
serviceProvider		3 B
)		B C
:		D E
base		F J
(		J K
serviceProvider		K Z
)		Z [
{

 	
} 	
} 
} ªH
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Product\ProductUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 

ProductUoW 
: 
BaseUnitOfWork ,
<, -

ProductUoW- 7
>7 8
,8 9
IProductUoW: E
{ 
public 

ProductUoW 
( 
IServiceProvider *
serviceProvider+ :
): ;
:< =
base> B
(B C
serviceProviderC R
)R S
{ 	
} 	
public 
async 
Task 
< 
Pagging !
<! "
Product" )
>) *
>* +#
GetProductsPaggingAsync, C
(C D 
ProductFilterRequestD X
requestY `
)` a
{ 	
try 
{ 
var 
skip 
= 
( 
request #
.# $
	PageIndex$ -
-. /
$num0 1
)1 2
*3 4
request5 <
.< =
PageSize= E
;E F
var 
take 
= 
request "
." #
PageSize# +
;+ ,
var 
products 
= 
await $
Products% -
.- .
GetAllAsync. 9
(9 :
): ;
;; <
if 
( 
products 
. 
CountExt %
(% &
)& '
<=( *
$num+ ,
), -
return. 4
new5 8
Pagging9 @
<@ A
ProductA H
>H I
(I J
)J K
{L M
	PageIndexN W
=X Y
requestZ a
.a b
	PageIndexb k
,k l
PageSizem u
=v w
requestx 
.	 Ä
PageSize
Ä à
,
à â
Data
ä é
=
è ê
new
ë î
List
ï ô
<
ô ö
Product
ö °
>
° ¢
(
¢ £
)
£ §
}
• ¶
;
¶ ß
if 
( 
! 
request 
. 

CategoryId '
.' (%
IsNullOrEmptyOrWhiteSpace( A
(A B
)B C
)C D
{ 
products 
= 
products '
.' (
Where( -
(- .
x. /
=>0 2
x3 4
.4 5
product_category_id5 H
==I K
requestL S
.S T

CategoryIdT ^
)^ _
._ `
ToList` f
(f g
)g h
;h i
}   
if"" 
("" 
request"" 
."" 
	SalePrice"" %
!=""& (
null"") -
&&"". 0
request""1 8
.""8 9
	SalePrice""9 B
>""C D
$num""E F
)""F G
{## 
products$$ 
=$$ 
products$$ '
.$$' (
Where$$( -
($$- .
x$$. /
=>$$0 2
x$$3 4
.$$4 5

sale_price$$5 ?
<=$$@ B
request$$C J
.$$J K
	SalePrice$$K T
)$$T U
.$$U V
ToList$$V \
($$\ ]
)$$] ^
;$$^ _
}%% 
if'' 
('' 
!'' 
request'' 
.'' 
Filter'' #
.''# $%
IsNullOrEmptyOrWhiteSpace''$ =
(''= >
)''> ?
)''? @
{(( 
products)) 
=)) 
products)) '
.))' (
Where))( -
())- .
x)). /
=>))0 2
x))3 4
.))4 5
product_name))5 A
.))A B
ContainsText))B N
())N O
request))O V
.))V W
Filter))W ]
)))] ^
)))^ _
.))_ `
ToList))` f
())f g
)))g h
;))h i
}** 
if,, 
(,, 
!,, 
request,, 
.,, 
Sort,, !
.,,! "%
IsNullOrEmptyOrWhiteSpace,," ;
(,,; <
),,< =
),,= >
{-- 
var.. 
sortCondition.. %
=..& '
request..( /
.../ 0
Sort..0 4
...4 5
Split..5 :
(..: ;
$str..; >
)..> ?
;..? @
if// 
(// 
sortCondition// %
!=//& (
null//) -
&&//. 0
sortCondition//1 >
.//> ?
Length//? E
>//F G
$num//H I
)//I J
{00 
request11 
.11  
OrderBy11  '
=11( )
sortCondition11* 7
[117 8
$num118 9
]119 :
==11; =
$str11> G
?11H I
request11J Q
.11Q R
OrderBy11R Y
:11Z [
sortCondition11\ i
[11i j
$num11j k
]11k l
;11l m
if22 
(22 
sortCondition22 )
.22) *
Length22* 0
>221 2
$num223 4
)224 5
{33 
request44 #
.44# $
SortType44$ ,
=44- .
sortCondition44/ <
[44< =
$num44= >
]44> ?
==44@ B
$str44C H
?44I J
SortType44K S
.44S T
ASC44T W
:44X Y
SortType44Z b
.44b c
DESC44c g
;44g h
}55 
}66 
}77 
if99 
(99 
!99 
request99 
.99 
OrderBy99 $
.99$ %%
IsNullOrEmptyOrWhiteSpace99% >
(99> ?
)99? @
)99@ A
{:: 
if;; 
(;; 
request;; 
.;;  
SortType;;  (
==;;) +
SortType;;, 4
.;;4 5
DESC;;5 9
);;9 :
{<< 
products==  
===! "
products==# +
.==+ ,
AsQueryable==, 7
(==7 8
)==8 9
.==9 :#
OrderByDescendingCustom==: Q
(==Q R
request==R Y
.==Y Z
OrderBy==Z a
)==a b
.==b c
ToList==c i
(==i j
)==j k
;==k l
}>> 
else?? 
{@@ 
productsAA  
=AA! "
productsAA# +
.AA+ ,
AsQueryableAA, 7
(AA7 8
)AA8 9
.AA9 :
OrderByCustomAA: G
(AAG H
requestAAH O
.AAO P
OrderByAAP W
)AAW X
.AAX Y
ToListAAY _
(AA_ `
)AA` a
;AAa b
}BB 
}CC 
longDD 

totalCountDD 
=DD  !
productsDD" *
.DD* +
CountExtDD+ 3
(DD3 4
)DD4 5
;DD5 6
productsEE 
=EE 
productsEE #
.EE# $
SkipEE$ (
(EE( )
skipEE) -
)EE- .
.EE. /
TakeEE/ 3
(EE3 4
takeEE4 8
)EE8 9
;EE9 :
varFF 

pageResultFF 
=FF  
newFF! $
PaggingFF% ,
<FF, -
ProductFF- 4
>FF4 5
(FF5 6
)FF6 7
{FF8 9
	PageIndexFF: C
=FFD E
requestFFF M
.FFM N
	PageIndexFFN W
,FFW X
PageSizeFFY a
=FFb c
requestFFd k
.FFk l
PageSizeFFl t
}FFu v
;FFv w
ifGG 
(GG 
productsGG 
==GG 
nullGG  $
||GG% '
productsGG( 0
.GG0 1
CountExtGG1 9
(GG9 :
)GG: ;
<=GG< >
$numGG? @
)GG@ A
returnGGB H

pageResultGGI S
;GGS T

pageResultII 
.II 
DataII 
=II  !
productsII" *
.II* +
ToListII+ 1
(II1 2
)II2 3
;II3 4

pageResultJJ 
.JJ 
TotalRecordJJ &
=JJ' (

totalCountJJ) 3
;JJ3 4

pageResultKK 
.KK 

TotalPagesKK %
=KK& '

totalCountKK( 2
%KK3 4
requestKK5 <
.KK< =
PageSizeKK= E
==KKF H
$numKKI J
?KKK L

totalCountKKM W
/KKX Y
requestKKZ a
.KKa b
PageSizeKKb j
:KKk l

totalCountKKm w
/KKx y
request	KKz Å
.
KKÅ Ç
PageSize
KKÇ ä
+
KKã å
$num
KKç é
;
KKé è
returnLL 

pageResultLL !
;LL! "
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
returnPP 
newPP 
PaggingPP "
<PP" #
ProductPP# *
>PP* +
(PP+ ,
)PP, -
;PP- .
}QQ 
}RR 	
}SS 
}TT ⁄
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Product\SizeUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
SizeUoW 
: 
BaseUnitOfWork )
<) *
SizeUoW* 1
>1 2
,2 3
ISizeUoW4 <
{ 
public		 
SizeUoW		 
(		 
IServiceProvider		 '
serviceProvider		( 7
)		7 8
:		9 :
base		; ?
(		? @
serviceProvider		@ O
)		O P
{

 	
} 	
} 
} Ô
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Shipment\ShipmentUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
ShipmentUoW 
: 
BaseUnitOfWork -
<- .
ShipmentUoW. 9
>9 :
,: ;
IShipmentUoW< H
{ 
public		 
ShipmentUoW		 
(		 
IServiceProvider		 +
serviceProvider		, ;
)		; <
:		= >
base		? C
(		C D
serviceProvider		D S
)		S T
{

 	
} 	
} 
} Ï
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Subcribers\AddressInfoUoW.cs
	namespace		 	
Web		
 
.		 
Infrastructure		 
.		 

UnitOfWork		 '
{

 
class 	
AddressInfoUoW
 
: 
BaseUnitOfWork )
<) *
AddressInfoUoW* 8
>8 9
,9 :
IAddressInfoUoW; J
{ 
public 
AddressInfoUoW 
( 
IServiceProvider .
serviceProvider/ >
)> ?
:@ A
baseB F
(F G
serviceProviderG V
)V W
{ 	
} 	
} 
} ô
|C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Subcribers\PermissionDetailUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
PermissionDetailUoW $
:% &
BaseUnitOfWork' 5
<5 6
PermissionDetailUoW6 I
>I J
,J K 
IPermissionDetailUoWL `
{ 
public		 
PermissionDetailUoW		 "
(		" #
IServiceProvider		# 3
serviceProvider		4 C
)		C D
:		E F
base		G K
(		K L
serviceProvider		L [
)		[ \
{

 	
} 	
} 
} ∏
ÇC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Subcribers\PermissionRelationshipUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class %
PermissionRelationshipUoW *
:+ ,
BaseUnitOfWork- ;
<; <%
PermissionRelationshipUoW< U
>U V
,V W&
IPermissionRelationshipUoWX r
{ 
public		 %
PermissionRelationshipUoW		 (
(		( )
IServiceProvider		) 9
serviceProvider		: I
)		I J
:		K L
base		M Q
(		Q R
serviceProvider		R a
)		a b
{

 	
} 	
} 
} ˚
vC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Subcribers\PermissionUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
PermissionUoW 
:  
BaseUnitOfWork! /
</ 0
PermissionUoW0 =
>= >
,> ?
IPermissionUoW@ N
{ 
public		 
PermissionUoW		 
(		 
IServiceProvider		 -
serviceProvider		. =
)		= >
:		? @
base		A E
(		E F
serviceProvider		F U
)		U V
{

 	
} 	
} 
} Õ
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Subcribers\UserUoW.cs
	namespace

 	
Web


 
.

 
Infrastructure

 
.

 

UnitOfWork

 '
{ 
public 

class 
UserUoW 
: 
BaseUnitOfWork )
<) *
UserUoW* 1
>1 2
,2 3
IUserUoW4 <
{ 
private 
const 
string 
Query "
=# $
$str% -
;- .
	protected 
readonly 
PostgreSqlContext ,
_context- 5
;5 6
public 
UserUoW 
( 
IServiceProvider '
serviceProvider( 7
)7 8
:9 :
base; ?
(? @
serviceProviderA P
)P Q
{ 	
} 	
} 
} Ó
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Infrastructure\UnitOfWork\Supplier\SupplierUoW.cs
	namespace 	
Web
 
. 
Infrastructure 
. 

UnitOfWork '
{ 
public 

class 
SupplierUoW 
: 
BaseUnitOfWork -
<- .

ProductUoW. 8
>8 9
,9 :
ISupplierUoW; G
{ 
public		 
SupplierUoW		 
(		 
IServiceProvider		 +
serviceProvider		, ;
)		; <
:		= >
base		? C
(		C D
serviceProvider		D S
)		S T
{

 	
} 	
} 
} 