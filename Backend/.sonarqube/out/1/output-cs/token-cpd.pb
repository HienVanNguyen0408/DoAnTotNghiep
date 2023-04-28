�
ZC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Storage\IStorageClient.cs
	namespace 	
Web
 
. 
Storage 
{ 
public		 

	interface		 
IStorageClient		 #
{

 
Task 
< 
bool 
> 
UploadFileAsync "
(" #
string# )
fullPath* 2
,2 3
byte4 8
[8 9
]9 :
byteFile; C
)C D
;D E
Task 
< 
string 
> $
GetPathFileDownloadAsync -
(- .
string. 4
fullPath5 =
,= >
int? B
secondsC J
=K L
$numM O
*P Q
$numR T
)T U
;U V
Task 
< 
byte 
[ 
] 
> 
DownloadFileAsync &
(& '
string' -
fullPath. 6
)6 7
;7 8
Task 
< 
string 
> 
GetFileStorageAsync (
(( )
string) /
fullPath0 8
)8 9
;9 :
Task 
< 
bool 
> "
DeleteFileStorageAsync )
() *
string* 0
fullPath1 9
)9 :
;: ;
} 
}   �T
YC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Storage\StorageClient.cs
	namespace 	
Web
 
. 
Storage 
{ 
public 

class 
StorageClient 
:  
IStorageClient! /
{ 
private 
readonly 
MinioClient $
_minioClient% 1
;1 2
private 
readonly 
StorageSettings (
_storageSettings) 9
;9 :
private 
readonly 
AmazonS3Client '

_awsClient( 2
;2 3
[ 	
Obsolete	 
] 
public 
StorageClient 
( 
IServiceProvider -
serviceProvider. =
)= >
{ 	
_storageSettings 
= 
serviceProvider .
.. /
GetRequiredService/ A
<A B
IOptionsB J
<J K
StorageSettingsK Z
>Z [
>[ \
(\ ]
)] ^
.^ _
Value_ d
;d e
var"" 
config"" 
="" 
new"" 
AmazonS3Config"" +
{## 
RegionEndpoint$$ 
=$$  
RegionEndpoint$$! /
.$$/ 0
USEast1$$0 7
,$$7 8

ServiceURL%% 
=%% 
_storageSettings%% -
.%%- .
EndPoint%%. 6
,%%6 7
ForcePathStyle&& 
=&&  
true&&! %
,&&% &
SignatureVersion''  
=''! "
$str''# &
}(( 
;(( 

_awsClient)) 
=)) 
new)) 
AmazonS3Client)) +
())+ ,
_storageSettings)), <
.))< =
	SecretKey))= F
,))F G
_storageSettings))H X
.))X Y
Password))Y a
,))a b
config))c i
)))i j
;))j k
}** 	
public-- 
async-- 
Task-- 
<-- 
bool-- 
>-- 
UploadFileAsync--  /
(--/ 0
string--0 6
fullPath--7 ?
,--? @
byte--A E
[--E F
]--F G
byteFile--H P
)--P Q
{.. 	
try// 
{00 
Stream11 
stream11 
=11 
new11  #
MemoryStream11$ 0
(110 1
byteFile111 9
)119 :
;11: ;
var22 
request22 
=22 
new22 !
PutObjectRequest22" 2
(222 3
)223 4
{33 

BucketName44 
=44  
_storageSettings44! 1
.441 2

BucketName442 <
,44< =
InputStream55 
=55  !
stream55" (
,55( )
AutoCloseStream66 #
=66$ %
true66& *
,66* +
Key77 
=77 
fullPath77 "
}88 
;88 
var99 
encodedFilename99 #
=99$ %
Uri99& )
.99) *
EscapeDataString99* :
(99: ;
$str99; E
)99E F
;99F G
request:: 
.:: 
Metadata::  
.::  !
Add::! $
(::$ %
$str::% 8
,::8 9
encodedFilename::: I
)::I J
;::J K
request;; 
.;; 
Headers;; 
.;;  
ContentDisposition;;  2
=;;3 4
$";;5 7
$str;;7 N
{;;N O
encodedFilename;;O ^
};;^ _
$str;;_ a
";;a b
;;;b c
await<< 

_awsClient<<  
.<<  !
PutObjectAsync<<! /
(<</ 0
request<<0 7
)<<7 8
;<<8 9
}== 
catch>> 
(>> 
	Exception>> 
ex>> 
)>>  
{?? 
return@@ 
false@@ 
;@@ 
}AA 
returnBB 
trueBB 
;BB 
}CC 	
publicEE 
asyncEE 
TaskEE 
<EE 
stringEE  
>EE  !$
GetPathFileDownloadAsyncEE" :
(EE: ;
stringEE; A
fullPathEEB J
,EEJ K
intEEL O
secondsEEP W
=EEX Y
$numEEZ \
*EE] ^
$numEE_ a
)EEa b
{FF 	
tryGG 
{HH 
varII 
pathDataII 
=II 

_awsClientII )
.II) *
GetPreSignedURLII* 9
(II9 :
newII: ="
GetPreSignedUrlRequestII> T
(IIT U
)IIU V
{JJ 

BucketNameKK 
=KK  
_storageSettingsKK! 1
.KK1 2

BucketNameKK2 <
,KK< =
KeyLL 
=LL 
fullPathLL "
,LL" #
ExpiresMM 
=MM 
DateTimeMM &
.MM& '
NowMM' *
.MM* +

AddMinutesMM+ 5
(MM5 6
secondsMM6 =
)MM= >
}NN 
)NN 
;NN 
returnOO 
pathDataOO 
.OO  
ReplaceOO  '
(OO' (
$strOO( /
,OO/ 0
$strOO1 7
)OO7 8
;OO8 9
}PP 
catchQQ 
(QQ 
	ExceptionQQ 
exQQ 
)QQ  
{RR 
returnSS 
stringSS 
.SS 
EmptySS #
;SS# $
}TT 
}UU 	
publicWW 
asyncWW 
TaskWW 
<WW 
byteWW 
[WW 
]WW  
>WW  !
DownloadFileAsyncWW" 3
(WW3 4
stringWW4 :
fullPathWW; C
)WWC D
{XX 	
tryYY 
{ZZ 
GetObjectRequest[[  
request[[! (
=[[) *
new[[+ .
GetObjectRequest[[/ ?
([[? @
)[[@ A
{\\ 

BucketName]] 
=]]  
_storageSettings]]! 1
.]]1 2

BucketName]]2 <
,]]< =
Key^^ 
=^^ 
fullPath^^ "
}__ 
;__ 
using`` 
(`` 
GetObjectResponse`` (
response``) 1
=``2 3
await``4 9

_awsClient``: D
.``D E
GetObjectAsync``E S
(``S T
request``T [
)``[ \
)``\ ]
usingaa 
(aa 
Streamaa 
streamaa $
=aa% &
responseaa' /
.aa/ 0
ResponseStreamaa0 >
)aa> ?
usingbb 
(bb 
MemoryStreambb #
msbb$ &
=bb' (
newbb) ,
MemoryStreambb- 9
(bb9 :
)bb: ;
)bb; <
{cc 
streamdd 
.dd 
CopyTodd !
(dd! "
msdd" $
)dd$ %
;dd% &
returnee 
msee 
.ee 
ToArrayee %
(ee% &
)ee& '
;ee' (
}ff 
;ff 
}gg 
catchhh 
(hh 
	Exceptionhh 
exhh 
)hh  
{ii 
returnjj 
nulljj 
;jj 
}kk 
}ll 	
publicss 
asyncss 
Taskss 
<ss 
stringss  
>ss  !
GetFileStorageAsyncss" 5
(ss5 6
stringss6 <
fullPathss= E
)ssE F
{tt 	
tryuu 
{vv 
GetObjectRequestww  
requestww! (
=ww) *
newww+ .
GetObjectRequestww/ ?
(ww? @
)ww@ A
{xx 

BucketNameyy 
=yy  
_storageSettingsyy! 1
.yy1 2

BucketNameyy2 <
,yy< =
Keyzz 
=zz 
fullPathzz "
}{{ 
;{{ 
using|| 
(|| 
GetObjectResponse|| (
response||) 1
=||2 3
await||4 9

_awsClient||: D
.||D E
GetObjectAsync||E S
(||S T
request||T [
)||[ \
)||\ ]
using}} 
(}} 
Stream}} 
stream}} $
=}}% &
response}}' /
.}}/ 0
ResponseStream}}0 >
)}}> ?
using~~ 
(~~ 
MemoryStream~~ #
ms~~$ &
=~~' (
new~~) ,
MemoryStream~~- 9
(~~9 :
)~~: ;
)~~; <
{ 
stream
�� 
.
�� 
CopyTo
�� !
(
��! "
ms
��" $
)
��$ %
;
��% &
var
�� 
byteFile
��  
=
��! "
ms
��# %
.
��% &
ToArray
��& -
(
��- .
)
��. /
;
��/ 0
if
�� 
(
�� 
byteFile
��  
!=
��! #
null
��$ (
&&
��) +
byteFile
��, 4
.
��4 5
Length
��5 ;
>
��< =
$num
��> ?
)
��? @
{
�� 
return
�� 
Convert
�� &
.
��& '
ToBase64String
��' 5
(
��5 6
byteFile
��6 >
)
��> ?
;
��? @
}
�� 
}
�� 
;
�� 
return
�� 
string
�� 
.
�� 
Empty
�� #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
string
�� 
.
�� 
Empty
�� #
;
��# $
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� $
DeleteFileStorageAsync
��  6
(
��6 7
string
��7 =
fullPath
��> F
)
��F G
{
�� 	
try
�� 
{
�� 
var
�� !
deleteObjectRequest
�� '
=
��( )
new
��* -!
DeleteObjectRequest
��. A
{
��B C

BucketName
��D N
=
��O P
_storageSettings
��Q a
.
��a b

BucketName
��b l
,
��l m
Key
��n q
=
��r s
fullPath
��t |
}
��} ~
;
��~ 
var
�� 
response
�� 
=
�� 

_awsClient
�� )
.
��) *
DeleteObjectAsync
��* ;
(
��; <!
deleteObjectRequest
��< O
)
��O P
;
��P Q
return
�� 
response
�� 
!=
��  "
null
��# '
;
��' (
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
}
�� 
}�� �
cC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Storage\StorageServiceExtension.cs
	namespace		 	
Web		
 
.		 
Storage		 
{

 
public 

static 
class #
StorageServiceExtension /
{ 
public 
static 
IServiceCollection (&
AddStorageServiceExtension) C
(C D
thisD H
IServiceCollectionI [
services\ d
,d e
IConfigurationf t
configuration	u �
)
� �
{ 	
services 
. 
AddTransient !
<! "
IStorageClient" 0
,0 1
StorageClient2 ?
>? @
(@ A
)A B
;B C
return 
services 
; 
} 	
} 
} �	
[C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Storage\StorageSettings.cs
	namespace 	
Web
 
. 
Storage 
{ 
public		 

class		 
StorageSettings		  
{

 
public 
const 
string 
CONFIG_NAME '
=( )
$str* ;
;; <
public 
string 
	SecretKey 
{  !
get" %
;% &
set' *
;* +
}, -
=. /
$str0 ;
;; <
public 
string 
Password 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
$str/ :
;: ;
public 
string 
EndPoint 
{  
get! $
;$ %
set& )
;) *
}+ ,
=- .
$str/ J
;J K
public 
string 

BucketName  
{! "
get# &
;& '
set( +
;+ ,
}- .
=/ 0
$str1 =
;= >
} 
} 