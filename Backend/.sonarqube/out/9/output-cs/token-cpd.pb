À
oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Entities\english\ByteArrayConverter.cs
	namespace 	
Web
 
. 
AppCore 
. 
Entities 
{ 
public		 

class		 
ByteArrayConverter		 #
:		$ %
JsonConverter		& 3
<		3 4
byte		4 8
[		8 9
]		9 :
>		: ;
{

 
public 
override 
byte 
[ 
] 
Read #
(# $
ref$ '
Utf8JsonReader( 6
reader7 =
,= >
Type? C
typeToConvertD Q
,Q R!
JsonSerializerOptionsS h
optionsi p
)p q
{ 	
short 
[ 
] 

sByteArray 
=  
JsonSerializer! /
./ 0
Deserialize0 ;
<; <
short< A
[A B
]B C
>C D
(D E
refE H
readerI O
)O P
;P Q
byte 
[ 
] 
value 
= 
new 
byte #
[# $

sByteArray$ .
.. /
Length/ 5
]5 6
;6 7
for 
( 
int 
i 
= 
$num 
; 
i 
< 

sByteArray  *
.* +
Length+ 1
;1 2
i3 4
++4 6
)6 7
{ 
value 
[ 
i 
] 
= 
( 
byte  
)  !

sByteArray! +
[+ ,
i, -
]- .
;. /
} 
return 
value 
; 
} 	
public 
override 
void 
Write "
(" #
Utf8JsonWriter# 1
writer2 8
,8 9
byte: >
[> ?
]? @
valueA F
,F G!
JsonSerializerOptionsH ]
options^ e
)e f
{ 	
writer 
. 
WriteStartArray "
(" #
)# $
;$ %
foreach 
( 
var 
val 
in 
value  %
)% &
{ 
writer 
. 
WriteNumberValue '
(' (
val( +
)+ ,
;, -
} 
writer 
. 
WriteEndArray  
(  !
)! "
;" #
}   	
}!! 
}## ∏
eC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Entities\Mysql\BaseEntity.cs
	namespace 	
Web
 
. 
AppCore 
. 
Entities 
{ 
public 

class 

BaseEntity 
{ 
public 
DateTime 
CreatedDate #
{$ %
get& )
;) *
set+ .
;. /
}0 1
=2 3
DateTime4 <
.< =
Now= @
;@ A
public 
DateTime 
ModifiedDate $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
DateTime5 =
.= >
Now> A
;A B
} 
} ›
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Entities\Mysql\ConfigurationMySql.cs
	namespace 	
Web
 
. 
AppCore 
. 
Entities 
{ 
public		 

class		 
ConfigurationMySql		 #
{

 
} 
} –
bC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Entities\ServiceResult.cs
	namespace 	
Web
 
. 
AppCore 
. 
Entities 
{ 
public		 

class		 
ServiceResult		 
<		 
T		  
>		  !
{

 
public 
T 
Data 
{ 
get 
; 
set  
;  !
}" #
public 
bool 
Success 
{ 
get !
;! "
set# &
;& '
}( )
=* +
false, 1
;1 2
public 
ServiceResultStatus "
Status# )
{* +
get, /
;/ 0
set1 4
;4 5
}6 7
public 
string 
Message 
{ 
get  #
;# $
set% (
;( )
}* +
} 
public 

enum 
ServiceResultStatus #
{ 
Ok 

= 
$num 
, 
Created 
= 
$num 
, 
Accepted 
= 
$num 
, 
	NoContent 
= 
$num 
, 

BadRequest 
= 
$num 
, 

Authorized 
= 
$num 
, 
NotFound 
= 
$num 
, 
ServerError 
= 
$num 
, 

BadGateway 
= 
$num 
, 
} 
public   

enum   
Message   
{!! 
}## 
}$$ ê
YC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\ExamForm.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public		 

enum		 
ExamForm		 
{

 
	SelectOne 
= 
$num 
, 

SelectMany 
= 
$num 
, 
	TrueFalse 
= 
$num 
, 
} 
} ˙
]C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\QuestionType.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public		 

enum		 
QuestionType		 
{

 
All 
= 
$num 
, 
Read 
= 
$num 
, 
Listen 
= 
$num 
} 
} ®
UC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\Role.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public		 

enum		 
Role		 
{

 
Admin 
= 
$num 
, 
User 
= 
$num 
} 
} ˝
ZC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\Translate.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public 

enum 
	Translate 
{ 
VN		 

=		 
$num		 
,		 
EN

 

=

 
$num

 
,

 
CHI 
= 
$num 
, 
} 
} Õ
ZC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\TypeLogin.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public 

enum 
	TypeLogin 
{ 
Normal 
= 
$num 
, 
Google 
= 
$num 
, 
Facebok 
= 
$num 
, 
Github 
= 
$num 
, 
} 
} Ü
YC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Enum\WordType.cs
	namespace 	
Web
 
. 
AppCore 
. 
Enum 
{ 
public 

enum 
WordType 
{ 
None 
= 
$num 
, 
Noune 
= 
$num 
, 
	Adjective 
= 
$num 
, 
Verb 
= 
$num 
, 
Adverb 
= 
$num 
, 
Pronouns 
= 
$num 
, 
} 
public!! 

enum!! !
StatusStudyVocabulary!! %
{"" 
None&& 
=&& 
$num&& 
,&& 
NewStudy(( 
=(( 
$num(( 
,(( 
Studied** 
=** 
$num** 
,** 
},, 
}-- ÷	
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Exceptions\ClientException.cs
	namespace 	
Web
 
. 
AppCore 
. 

Exceptions  
{ 
public		 

class		 
ClientException		  
:		  !
	Exception		" +
{

 
public 
ClientException 
( 
string %
msg& )
)) *
:+ ,
base- 1
(1 2
msg2 5
)5 6
{ 	
} 	
public 
ClientException 
( 
string %
msg& )
,) *
	Exception, 5
ex6 8
)8 9
:: ;
base< @
(@ A
msgA D
,D E
exE G
)G H
{ 	
} 	
public 
ClientException 
( 
object %
ob& (
)( )
{ 	
this 
. 
Data 
. 
Add 
( 
$num 
, 
ob 
)  
;  !
} 	
}!! 
}"" æ
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Blog\IBlogCategoryUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IBlogCategoryUoW		 %
:		& '
IBaseUnitOfWork		( 7
{

 
} 
} Æ
oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Blog\IBlogUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IBlogUoW		 
:		 
IBaseUnitOfWork		  /
{

 
} 
} ∞
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Blog\IImageUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
	IImageUoW		 
:		  
IBaseUnitOfWork		! 0
{

 
} 
} ∫
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Customer\ICustomerUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
ICustomerUoW		 !
:		" #
IBaseUnitOfWork		$ 3
{

 
} 
} ì
qC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\IBaseUnitOfWork.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public 

	interface 
IBaseUnitOfWork $
{ 
	IBaseRepo 
< 
User 
> 
Users 
{ 
get  #
;# $
}% &
	IBaseRepo		 
<		 
AddressInfo		 
>		 
AddressInfos		 +
{		, -
get		. 1
;		1 2
}		3 4
	IBaseRepo

 
<

 
Avatar

 
>

 
Avatars

 !
{

" #
get

$ '
;

' (
}

) *
	IBaseRepo 
< 
Color 
> 
Colors 
{  !
get" %
;% &
}' (
	IBaseRepo 
< 
Product 
> 
Products #
{$ %
get& )
;) *
}+ ,
	IBaseRepo 
< 
ProductCategory !
>! "
ProductCategories# 4
{5 6
get7 :
;: ;
}< =
	IBaseRepo 
< 
Customer 
> 
	Customers %
{& '
get( +
;+ ,
}- .
	IBaseRepo 
< 
Order 
> 
Orders 
{  !
get" %
;% &
}' (
	IBaseRepo 
< 
	OrderItem 
> 

OrderItems '
{( )
get* -
;- .
}/ 0
	IBaseRepo 
< 
Blog 
> 
Blogs 
{ 
get  #
;# $
}% &
	IBaseRepo 
< 
BlogCategory 
> 
BlogCategories  .
{/ 0
get1 4
;4 5
}6 7
	IBaseRepo 
< 
Image 
> 
Images 
{  !
get" %
;% &
}' (
	IBaseRepo 
< 

Permission 
> 
Permissions )
{* +
get, /
;/ 0
}1 2
	IBaseRepo 
< 
PermissionDetail "
>" #
PermissionDetails$ 5
{6 7
get8 ;
;; <
}= >
	IBaseRepo 
< "
PermissionRelationship (
>( )#
PermissionRelationships* A
{B C
getD G
;G H
}I J
} 
} π
uC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Order\IOrderItemUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IOrderItemUoW		 "
:		# $
IBaseUnitOfWork		% 4
{

 
} 
} ±
qC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Order\IOrderUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
	IOrderUoW		 
:		  
IBaseUnitOfWork		! 0
{

 
} 
} ≥
sC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Product\IColorUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
	IColorUoW		 
:		  
IBaseUnitOfWork		! 0
{

 
} 
} «
}C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Product\IProductCategoryUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IProductCategoryUoW		 (
:		) *
IBaseUnitOfWork		+ :
{

 
} 
} ∏
uC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Product\IProductUoW.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 

Interfaces		  
.		  !

Repository		! +
{

 
public 

	interface 
IProductUoW  
:! "
IBaseUnitOfWork# 2
{ 
Task 
< 
Pagging 
< 
Product 
> 
> #
GetProductsPaggingAsync 6
(6 7 
ProductFilterRequest7 K
requestL S
)S T
;T U
} 
} ±
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Product\ISizeUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
ISizeUoW		 
:		 
IBaseUnitOfWork		  /
{

 
} 
} ∫
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Shipment\IShipmentUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IShipmentUoW		 !
:		" #
IBaseUnitOfWork		$ 3
{

 
} 
} ¬
|C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IAddressInfoUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
IAddressInfoUoW		 $
:		% &
IBaseUnitOfWork		' 6
{

 
} 
} Õ
ÅC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IPermissionDetailUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{		 
public

 

	interface

  
IPermissionDetailUoW

 )
:

* +
IBaseUnitOfWork

, ;
{ 
} 
} Ÿ
áC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IPermissionRelationshipUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{		 
public

 

	interface

 &
IPermissionRelationshipUoW

 /
:

0 1
IBaseUnitOfWork

2 A
{ 
} 
} ¿
{C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IPermissionUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{		 
public

 

	interface

 
IPermissionUoW

 #
:

$ %
IBaseUnitOfWork

& 5
{ 
} 
} ¥
uC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IUserUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{		 
public

 

	interface

 
IUserUoW

 
:

 
IBaseUnitOfWork

  /
{ 
} 
} ∫
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Supplier\ISupplierUoW.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !

Repository! +
{ 
public		 

	interface		 
ISupplierUoW		 !
:		" #
IBaseUnitOfWork		$ 3
{

 
} 
} ∞
qC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Blog\IBlogService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface 
IBlogService !
:" #
IBaseDomainService$ 6
{ 
Task 
< 
IEnumerable 
< 
BlogCategory %
>% &
>& '"
GetBlogCategoriesAsync( >
(> ?
)? @
;@ A
Task 
< 
Pagging 
< 
BlogCategory !
>! "
>" #)
GetBlogCategoriesPaggingAsync$ A
(A B

PaginationB L

paginationM W
)W X
;X Y
Task"" 
<"" 
BlogCategory"" 
>""  
GetBlogCategoryAsync"" /
(""/ 0
string""0 6
blogCategoryId""7 E
)""E F
;""F G
Task)) 
<)) 
bool)) 
>)) #
InsertBlogCategoryAsync)) *
())* +
BlogCategory))+ 7
blogCategory))8 D
)))D E
;))E F
Task00 
<00 
bool00 
>00 #
UpdateBlogCategoryAsync00 *
(00* +
BlogCategory00+ 7
blogCategory008 D
)00D E
;00E F
Task77 
<77 
DeleteStatus77 
>77 #
DeleteBlogCategoryAsync77 2
(772 3
BlogCategory773 ?
blogCategory77@ L
)77L M
;77M N
Task@@ 
<@@ 
IEnumerable@@ 
<@@ 
Blog@@ 
>@@ 
>@@ 
GetBlogsAsync@@  -
(@@- .
)@@. /
;@@/ 0
TaskFF 
<FF 
PaggingFF 
<FF 
BlogResponeFF  
>FF  !
>FF! " 
GetBlogsPaggingAsyncFF# 7
(FF7 8

PaginationFF8 B

paginationFFC M
)FFM N
;FFN O
TaskMM 
<MM 
BlogResponeMM 
>MM 
GetBlogAsyncMM &
(MM& '
stringMM' -
blogIdMM. 4
)MM4 5
;MM5 6
TaskTT 
<TT 
boolTT 
>TT 
InsertBlogAsyncTT "
(TT" #
BlogRequestTT# .
blogTT/ 3
)TT3 4
;TT4 5
Task[[ 
<[[ 
bool[[ 
>[[ 
UpdateBlogAsync[[ "
([[" #
BlogRequest[[# .
blogRequest[[/ :
)[[: ;
;[[; <
Taskbb 
<bb 
boolbb 
>bb 
DeleteBlogAsyncbb "
(bb" #
Blogbb# '
blogbb( ,
)bb, -
;bb- .
Taskcc 
<cc 
boolcc 
>cc 
DeleteBlogsAsynccc #
(cc# $
Listcc$ (
<cc( )
Blogcc) -
>cc- .
blogscc/ 4
)cc4 5
;cc5 6
}gg 
}hh ¡
yC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Customer\ICustomerService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface 
ICustomerService %
:& '
IBaseDomainService( :
{ 
}55 
}66 í
yC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\download\IDownloadService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{		 
public

 

	interface

 
IDownloadService

 %
{ 
} 
} ‹
|C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\download\IImportExcelService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{		 
public

 

	interface

 
IImportExcelService

 (
{ 
Task 
< 
bool 
> $
ImportDataExcelToDBAsync +
(+ ,
ExcelRequest, 8
request9 @
)@ A
;A B
} 
} ç
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\IBaseDomainService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{		 
public

 

	interface

 
IBaseDomainService

 '
{ 
} 
} ⁄	
{C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\MessageQueue\IConsumerQueue.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 

Interfaces		  
.		  !
Services		! )
.		) *
MessageQueue		* 6
{

 
public 

	interface 
IConsumerQueue #
{ 
Task 
StartConsumeAsync 
( 
Func #
<# $
Order$ )
,) *
IDictionary+ 6
<6 7
string7 =
,= >
object? E
>E F
,F G
TaskH L
<L M
boolM Q
>Q R
>R S
onMessageHandleT c
)c d
;d e
Task 
StartConsumeAsync 
( 
Func #
<# $
OrderRequest$ 0
,0 1
IDictionary2 =
<= >
string> D
,D E
objectF L
>L M
,M N
TaskO S
<S T
boolT X
>X Y
>Y Z
onMessageHandle[ j
)j k
;k l
} 
} ó	
|C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\MessageQueue\IPublisherQueue.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
.) *
MessageQueue* 6
{ 
public		 

	interface		 
IPublisherQueue		 $
{

 
Task 
< 
bool 
> #
PublishUpdateOrderAsync *
(* +
object+ 1
data2 6
,6 7
IDictionary8 C
<C D
stringD J
,J K
objectL R
>R S
headersT [
=\ ]
null^ b
)b c
;c d
Task 
< 
bool 
> #
PublishInsertOrderAsync *
(* +
object+ 1
data2 6
,6 7
IDictionary8 C
<C D
stringD J
,J K
objectL R
>R S
headersT [
=\ ]
null^ b
)b c
;c d
} 
} ∂
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Order\ICartService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public		 

	interface		 
ICartService		 !
:		" #
IBaseDomainService		$ 6
{

 
} 
} ¿
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Order\IOrderItemService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public		 

	interface		 
IOrderItemService		 &
:		' (
IBaseDomainService		) ;
{

 
} 
} Œ
sC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Order\IOrderService.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 

Interfaces		  
.		  !
Services		! )
{

 
public 

	interface 
IOrderService "
:# $
IBaseDomainService% 7
{ 
Task 
< 
bool 
> #
UpdatePaymentOrderAsync *
(* +
)+ ,
;, -
Task 
< 
bool 
> 
InsertOrderAsync #
(# $
OrderRequest$ 0
order1 6
)6 7
;7 8
Task 
< 
bool 
> #
InsertOrderOnQueueAsync *
(* +
OrderRequest+ 7
order8 =
,= >
IDictionary? J
<J K
stringK Q
,Q R
objectS Y
>Y Z
headers[ b
)b c
;c d
Task$$ 
<$$ 
bool$$ 
>$$ 
DeleteOrderAsync$$ #
($$# $
string$$$ *
orderId$$+ 2
)$$2 3
;$$3 4
Task++ 
<++ 
bool++ 
>++ 
DeleteOrdersAsync++ $
(++$ %
IEnumerable++% 0
<++0 1
string++1 7
>++7 8
orderIds++9 A
)++A B
;++B C
Task33 
<33 
bool33 
>33 
UpdateOrderAsync33 #
(33# $
Order33$ )
order33* /
)33/ 0
;330 1
Task;; 
<;; 
Pagging;; 
<;; 
Order;; 
>;; 
>;; 
GetOrderPageAsync;; .
(;;. /

Pagination;;/ 9

pagination;;: D
,;;D E
Func;;F J
<;;J K
Order;;K P
,;;P Q
bool;;R V
>;;V W
	predicate;;X a
=;;b c
null;;d h
);;h i
;;;i j
TaskCC 
<CC 
OrderCC 
>CC 
GetOrderAsyncCC !
(CC! "
stringCC" (
orderIdCC) 0
)CC0 1
;CC1 2
TaskEE 
<EE 
boolEE 
>EE #
UpdateOrderOnQueueAsyncEE *
(EE* +
OrderEE+ 0
orderEE1 6
,EE6 7
IDictionaryEE8 C
<EEC D
stringEED J
,EEJ K
objectEEL R
>EER S
headersEET [
)EE[ \
;EE\ ]
}FF 
}GG ò
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Product\IProductService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface 
IProductService $
:% &
IBaseDomainService' 9
{ 
Task 
< 
IEnumerable 
< 
ProductCategory (
>( )
>) *%
GetProductCategoriesAsync+ D
(D E
)E F
;F G
Task 
< 
Pagging 
< 
ProductCategory $
>$ %
>% &,
 GetProductCategoriesPaggingAsync' G
(G H

PaginationH R

paginationS ]
)] ^
;^ _
Task"" 
<"" 
ProductCategory"" 
>"" #
GetProductCategoryAsync"" 5
(""5 6
string""6 <
productCategoryId""= N
)""N O
;""O P
Task)) 
<)) 
bool)) 
>)) &
InsertProductCategoryAsync)) -
())- .
ProductCategory)). =
productCategory))> M
)))M N
;))N O
Task00 
<00 
bool00 
>00 &
UpdateProductCategoryAsync00 -
(00- .
ProductCategory00. =
productCategory00> M
)00M N
;00N O
Task77 
<77 
DeleteStatus77 
>77 &
DeleteProductCategoryAsync77 5
(775 6"
ProductCategoryRequest776 L
productCategory77M \
)77\ ]
;77] ^
TaskAA 
<AA 
IEnumerableAA 
<AA 
ProductAA  
>AA  !
>AA! "
GetProductsAsyncAA# 3
(AA3 4
)AA4 5
;AA5 6
TaskGG 
<GG 
PaggingGG 
<GG 
ProductResponeGG #
>GG# $
>GG$ %#
GetProductsPaggingAsyncGG& =
(GG= > 
ProductFilterRequestGG> R
requestGGS Z
,GGZ [
boolGG\ `
isAdminGGa h
=GGi j
falseGGk p
)GGp q
;GGq r
TaskNN 
<NN 
ProductResponeNN 
>NN 
GetProductAsyncNN ,
(NN, -
stringNN- 3
	productIdNN4 =
)NN= >
;NN> ?
TaskUU 
<UU 
boolUU 
>UU 
InsertProductAsyncUU %
(UU% &
ProductRequestUU& 4
productUU5 <
)UU< =
;UU= >
Task\\ 
<\\ 
bool\\ 
>\\ 
UpdateProductAsync\\ %
(\\% &
ProductRequest\\& 4
product\\5 <
)\\< =
;\\= >
Taskcc 
<cc 
DeleteStatuscc 
>cc 
DeleteProductAsynccc -
(cc- .
Productcc. 5
productcc6 =
)cc= >
;cc> ?
Taskee 
<ee 
DeleteStatusee 
>ee 
DeleteProductsAsyncee .
(ee. /
IEnumerableee/ :
<ee: ;
Productee; B
>eeB C
productseeD L
)eeL M
;eeM N
}hh 
}ii ¡
yC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Shipment\IShipmentService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public		 

	interface		 
IShipmentService		 %
:		& '
IBaseDomainService		( :
{

 
} 
} œ
~C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IAddressInfoService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{		 
public

 

	interface

 
IAddressInfoService

 (
{ 
Task 
< 
List 
< 
AddressInfo 
> 
> 
GetAddressInfos  /
(/ 0
string0 6
userId7 =
)= >
;> ?
Task 
< 
AddressInfo 
> !
GetAddressInfoDefault /
(/ 0
string0 6
userId7 =
)= >
;> ?
Task 
< 
bool 
> 
SetDefaultAddress $
($ %
string% +
userId, 2
,2 3
string4 :
id; =
,= >
bool? C
	isDefaultD M
)M N
;N O
Task 
< 
AddressInfo 
> 
GetAddressInfo (
(( )
string) /
id0 2
)2 3
;3 4
Task 
< 
bool 
> 
UpdateAddressInfo $
($ %
AddressInfo% 0
addressInfo1 <
)< =
;= >
Task 
< 
bool 
> 
InsertAddressInfo $
($ %
AddressInfo% 0
addressInfo1 <
)< =
;= >
Task 
< 
bool 
> 
DeleteAddressInfo $
($ %
string% +
id, .
). /
;/ 0
} 
} ‘
ÉC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IPermissionDetailService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface $
IPermissionDetailService -
:. /
IBaseDomainService0 B
{ 
}		 
}

 ‡
âC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IPermissionRelationshipService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface *
IPermissionRelationshipService 3
:4 5
IBaseDomainService6 H
{ 
}		 
}

 «
}C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IPermissionService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface 
IPermissionService '
:) *
IBaseDomainService+ =
{ 
}		 
}

 É
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IRoleService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public		 

	interface		 
IRoleAccessService		 '
{

 
Task 
< 
bool 
> 
IsAdminRoleAsync #
(# $
string$ *
userId+ 1
,1 2
string3 9
subcriberId: E
)E F
;F G
} 
} ﬂ
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IUserService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public 

	interface 
IUserService !
{ 
Task 
< 
User 
> 
GetUserByIdAsync #
(# $
string$ *
userId+ 1
)1 2
;2 3
Task 
< 
User 
> "
GetUserByUserNameAsync )
() *
string* 0
userName1 9
)9 :
;: ;
Task 
< 
IEnumerable 
< 
User 
> 
> 
GetUsersAsync  -
(- .
). /
;/ 0
Task!! 
<!! 
Pagging!! 
<!! 
User!! 
>!! 
>!! 
GetUserPageAsync!! ,
(!!, -

Pagination!!- 7

pagination!!8 B
)!!B C
;!!C D
Task'' 
<'' 
bool'' 
>'' 
InsertUserAsync'' "
(''" #
User''# '
user''( ,
)'', -
;''- .
Task.. 
<.. 
bool.. 
>.. 
DeleteUserAsync.. "
(.." #
string..# )
userId..* 0
)..0 1
;..1 2
Task55 
<55 
bool55 
>55 
DeleteUserAsync55 "
(55" #
List55# '
<55' (
string55( .
>55. /
userIds550 7
)557 8
;558 9
Task<< 
<<< 
bool<< 
><< 
UpdateUserAsync<< "
(<<" #
User<<# '
user<<( ,
)<<, -
;<<- .
Task>> 
<>> 
bool>> 
>>> "
UpdateInfoAddressAsync>> )
(>>) *
User>>* .
user>>/ 3
)>>3 4
;>>4 5
}?? 
}@@ ¡
yC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Supplier\ISupplierService.cs
	namespace 	
Web
 
. 
AppCore 
. 

Interfaces  
.  !
Services! )
{ 
public		 

	interface		 
ISupplierService		 %
:		& '
IBaseDomainService		( :
{

 
} 
} ∫

\C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Logging\HLogging.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 
Logging		 
{

 
public 

class 
HLogging 
: 
	IHLogging %
{ 
private 
static 
Logger 
_logger %
=& '

LogManager( 2
.2 3!
GetCurrentClassLogger3 H
(H I
)I J
;J K
public 
void 
LogError 
( 
string #
message$ +
,+ ,
	Exception, 5
?5 6
ex7 9
)9 :
{ 	
_logger 
. 
Error 
( 
message !
,! "
ex" $
)$ %
;% &
} 	
public 
void 
LogInfor 
( 
string #
message$ +
,+ ,
	Exception, 5
?5 6
ex7 9
)9 :
{ 	
_logger 
. 
Info 
( 
message  
,  !
ex! #
)# $
;$ %
} 	
} 
} Õ
]C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Logging\IHLogging.cs
	namespace 	
Web
 
. 
AppCore 
. 
Logging 
{ 
public		 

	interface		 
	IHLogging		 
{

 
void 
LogError 
( 
string 
message $
,$ %
	Exception& /
?/ 0
ex1 3
)3 4
;4 5
void 
LogInfor 
( 
string 
message $
,$ %
	Exception& /
?/ 0
ex1 3
)3 4
;4 5
} 
} Ì.
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\ServiceCollectionExtension.cs
	namespace

 	
Web


 
.

 
AppCore

 
{ 
public 

static 
class &
ServiceCollectionExtension 2
{ 
public 
static 
IServiceCollection (
AddAppCoreService) :
(: ;
this; ?
IServiceCollection@ R
servicesS [
)[ \
{ 	
services 
. !
AddDataServiceAppCore *
(* +
)+ ,
. "
AddMessageQueueService +
(+ ,
), -
;- .
return 
services 
; 
} 	
public 
static 
IServiceCollection (!
AddDataServiceAppCore) >
(> ?
this? C
IServiceCollectionD V
servicesW _
)_ `
{ 	
services 
. 
AddTransient !
<! "
IDownloadService" 2
,2 3
DowloadService4 B
>B C
(C D
)D E
;E F
services 
. 
AddTransient !
<! "
IImportExcelService" 5
,5 6
ImportExcelService7 I
>I J
(J K
)K L
;L M
services 
. 
AddTransient !
<! "
IUserService" .
,. /
UserService0 ;
>; <
(< =
)= >
;> ?
services 
. 
AddTransient !
<! "
IRoleAccessService" 4
,4 5
RoleAccessService6 G
>G H
(H I
)I J
;J K
services 
. 
AddTransient !
<! "
ISupplierService" 2
,2 3
SupplierService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
IProductService" 1
,1 2
ProductService3 A
>A B
(B C
)C D
;D E
services 
. 
AddTransient !
<! "
IShipmentService" 2
,2 3
ShipmentService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
ICustomerService" 2
,2 3
CustomerService4 C
>C D
(D E
)E F
;F G
services 
. 
AddTransient !
<! "
IProductService" 1
,1 2
ProductService3 A
>A B
(B C
)C D
;D E
services   
.   
AddTransient   !
<  ! "
IOrderService  " /
,  / 0
OrderService  1 =
>  = >
(  > ?
)  ? @
;  @ A
services!! 
.!! 
AddTransient!! !
<!!! "
IOrderItemService!!" 3
,!!3 4
OrderItemService!!5 E
>!!E F
(!!F G
)!!G H
;!!H I
services"" 
."" 
AddTransient"" !
<""! "
IBlogService""" .
,"". /
BlogService""0 ;
>""; <
(""< =
)""= >
;""> ?
services## 
.## 
AddTransient## !
<##! "
IPermissionService##" 4
,##4 5
PermissionService##6 G
>##G H
(##H I
)##I J
;##J K
services$$ 
.$$ 
AddTransient$$ !
<$$! "$
IPermissionDetailService$$" :
,$$: ;#
PermissionDetailService$$< S
>$$S T
($$T U
)$$U V
;$$V W
services%% 
.%% 
AddTransient%% !
<%%! "*
IPermissionRelationshipService%%" @
,%%@ A)
PermissionRelationshipService%%B _
>%%_ `
(%%` a
)%%a b
;%%b c
services&& 
.&& 
AddTransient&& !
<&&! "
ICartService&&" .
,&&. /
CartService&&0 ;
>&&; <
(&&< =
)&&= >
;&&> ?
services'' 
.'' 
AddTransient'' !
<''! "
IAddressInfoService''" 5
,''5 6
AddressInfoService''7 I
>''I J
(''J K
)''K L
;''L M
return(( 
services(( 
;(( 
})) 	
public++ 
static++ 
IServiceCollection++ ("
AddMessageQueueService++) ?
(++? @
this++@ D
IServiceCollection++E W
services++X `
)++` a
{,, 	
services-- 
.-- 
AddTransient-- !
(--! "
typeof--" (
(--( )
	IConsumer--) 2
<--2 3
>--3 4
)--4 5
,--5 6
typeof--7 =
(--= >
Consumer--> F
<--F G
>--G H
)--H I
)--I J
;--J K
services.. 
... 
AddTransient.. !
<..! "

IPublisher.." ,
,.., -
	Publisher... 7
>..7 8
(..8 9
)..9 :
;..: ;
services// 
.// 
AddTransient// !
<//! "
IPublisherQueue//" 1
,//1 2
PublisherQueue//3 A
>//A B
(//B C
)//C D
;//D E
services00 
.00 
AddTransient00 !
<00! "
IConsumerQueue00" 0
,000 1
ConsumerQueue002 ?
>00? @
(00@ A
)00A B
;00B C
return11 
services11 
;11 
}22 	
}33 
}44 •
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\BaseDomainService.cs
	namespace

 	
Web


 
.

 
AppCore

 
.

 
Services

 
{ 
public 

class 
BaseDomainService "
<" #
T# $
>$ %
:& '
	BaseClass( 1
<1 2
T2 3
>3 4
,4 5
IBaseDomainService6 H
{ 
	protected 
readonly 
PostgresSettings +
_postgresSettings, =
;= >
	protected 
readonly 
AppSettings &
_appSettings' 3
;3 4
	protected 
readonly 
IRedisCached '
_cached( /
;/ 0
	protected 
readonly 
DbFunctions &
_dbFunctions' 3
;3 4
public 
BaseDomainService  
(  !
IServiceProvider! 1
serviceProvider2 A
)A B
:C D
baseE I
(I J
serviceProviderJ Y
)Y Z
{ 	
_postgresSettings 
= 
new  #
PostgresSettings$ 4
(4 5
)5 6
;6 7
_cached 
= 
serviceProvider %
.% &
GetRequiredService& 8
<8 9
IRedisCached9 E
>E F
(F G
)G H
;H I
} 	
	protected 
string 
GetKeyCached %
(% &
int& )
skip* .
,. /
int0 3
take4 8
)8 9
=>: <
$"= ?
$str? R
{R S
takeS W
}W X
$strX Y
{Y Z
skipZ ^
}^ _
"_ `
;` a
}   
}!! ŒÉ
eC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Blog\BlogService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
BlogService 
: 
BaseDomainService 0
<0 1
BlogService1 <
>< =
,= >
IBlogService? K
{ 
private 
readonly 
IBlogUoW !
_blogUoW" *
;* +
private 
readonly 
	IImageUoW "
	_imageUoW# ,
;, -
private 
readonly 
IBlogCategoryUoW )
_blogCategoryUoW* :
;: ;
private 
readonly 
IStorageClient '
_storageClient( 6
;6 7
public 
BlogService 
( 
IServiceProvider +
serviceProvider, ;
); <
:= >
base? C
(C D
serviceProviderD S
)S T
{ 	
_blogUoW 
= 
serviceProvider &
.& '
GetRequiredService' 9
<9 :
IBlogUoW: B
>B C
(C D
)D E
;E F
	_imageUoW   
=   
serviceProvider   '
.  ' (
GetRequiredService  ( :
<  : ;
	IImageUoW  ; D
>  D E
(  E F
)  F G
;  G H
_blogCategoryUoW!! 
=!! 
serviceProvider!! .
.!!. /
GetRequiredService!!/ A
<!!A B
IBlogCategoryUoW!!B R
>!!R S
(!!S T
)!!T U
;!!U V
_storageClient"" 
="" 
serviceProvider"" ,
."", -
GetRequiredService""- ?
<""? @
IStorageClient""@ N
>""N O
(""O P
)""P Q
;""Q R
}## 	
public00 
async00 
Task00 
<00 
DeleteStatus00 &
>00& '#
DeleteBlogCategoryAsync00( ?
(00? @
BlogCategory00@ L
blogCategory00M Y
)00Y Z
{11 	
try22 
{33 
var55 
blogs55 
=55 
await55 !
_blogUoW55" *
.55* +
Blogs55+ 0
.550 1
GetAllAsync551 <
(55< =
x55= >
=>55? A
x55B C
.55C D
blog_category_id55D T
==55U W
blogCategory55X d
.55d e
id55e g
)55g h
;55h i
if66 
(66 
blogs66 
!=66 
null66 !
&&66" $
blogs66% *
.66* +
Count66+ 0
(660 1
)661 2
>663 4
$num665 6
)666 7
return668 >
DeleteStatus66? K
.66K L
Incurred66L T
;66T U
var88 
	resDelete88 
=88 
await88  %
_blogCategoryUoW88& 6
.886 7
BlogCategories887 E
.88E F
DeleteOneAsync88F T
(88T U
blogCategory88U a
)88a b
;88b c
return99 
	resDelete99  
?99! "
DeleteStatus99# /
.99/ 0
Success990 7
:998 9
DeleteStatus99: F
.99F G
Fail99G K
;99K L
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
return== 
DeleteStatus== #
.==# $
Fail==$ (
;==( )
}>> 
}?? 	
publicEE 
asyncEE 
TaskEE 
<EE 
IEnumerableEE %
<EE% &
BlogCategoryEE& 2
>EE2 3
>EE3 4"
GetBlogCategoriesAsyncEE5 K
(EEK L
)EEL M
{FF 	
tryGG 
{HH 
varII 
blogCategoriesII "
=II# $
awaitII% *
_blogCategoryUoWII+ ;
.II; <
BlogCategoriesII< J
.IIJ K
GetAllAsyncIIK V
(IIV W
)IIW X
;IIX Y
returnJJ 
blogCategoriesJJ %
;JJ% &
}KK 
catchLL 
(LL 
	ExceptionLL 
exLL 
)LL  
{MM 
varNN 
blogNN 
=NN 
newNN 
BlogCategoryNN +
(NN+ ,
)NN, -
;NN- .
blogOO 
.OO 
descriptionOO  
=OO! "
$"OO# %
{OO% &
exOO& (
.OO( )
MessageOO) 0
}OO0 1
"OO1 2
;OO2 3
varPP 
blogsPP 
=PP 
newPP 
ListPP  $
<PP$ %
BlogCategoryPP% 1
>PP1 2
(PP2 3
)PP3 4
;PP4 5
blogsQQ 
.QQ 
AddQQ 
(QQ 
blogQQ 
)QQ 
;QQ  
returnRR 
blogsRR 
;RR 
}SS 
}TT 	
public\\ 
async\\ 
Task\\ 
<\\ 
Pagging\\ !
<\\! "
BlogCategory\\" .
>\\. /
>\\/ 0)
GetBlogCategoriesPaggingAsync\\1 N
(\\N O

Pagination\\O Y

pagination\\Z d
)\\d e
{]] 	
if^^ 
(^^ 

pagination^^ 
.^^ 
Filter^^ !
.^^! "%
IsNullOrEmptyOrWhiteSpace^^" ;
(^^; <
)^^< =
)^^= >
return^^? E
await^^F K
_blogCategoryUoW^^L \
.^^\ ]
BlogCategories^^] k
.^^k l
GetPaggingAsync^^l {
(^^{ |

pagination	^^| Ü
)
^^Ü á
;
^^á à
var__ 

pageResult__ 
=__ 
await__ "
_blogCategoryUoW__# 3
.__3 4
BlogCategories__4 B
.__B C
GetPaggingAsync__C R
(__R S

pagination__S ]
,__] ^
x___ `
=>__a c
x__d e
.__e f
name__f j
.__j k
ContainsText__k w
(__w x

pagination	__x Ç
.
__Ç É
Filter
__É â
)
__â ä
)
__ä ã
;
__ã å
return`` 

pageResult`` 
;`` 
}aa 	
publichh 
asynchh 
Taskhh 
<hh 
BlogCategoryhh &
>hh& ' 
GetBlogCategoryAsynchh( <
(hh< =
stringhh= C
blogCategoryIdhhD R
)hhR S
{ii 	
returnjj 
awaitjj 
_blogCategoryUoWjj )
.jj) *
BlogCategoriesjj* 8
.jj8 9
GetByIdAsyncjj9 E
(jjE F
blogCategoryIdjjF T
)jjT U
;jjU V
}kk 	
publicrr 
asyncrr 
Taskrr 
<rr 
boolrr 
>rr #
InsertBlogCategoryAsyncrr  7
(rr7 8
BlogCategoryrr8 D
blogCategoryrrE Q
)rrQ R
{ss 	
vartt 
blogCatett 
=tt 
awaittt  
_blogCategoryUoWtt! 1
.tt1 2
BlogCategoriestt2 @
.tt@ A
InsertOneAsyncttA O
(ttO P
blogCategoryttP \
)tt\ ]
;tt] ^
returnuu 
blogCateuu 
!=uu 
nulluu #
;uu# $
}vv 	
public~~ 
async~~ 
Task~~ 
<~~ 
bool~~ 
>~~ #
UpdateBlogCategoryAsync~~  7
(~~7 8
BlogCategory~~8 D
blogCategory~~E Q
)~~Q R
{ 	
return
ÄÄ 
await
ÄÄ 
_blogCategoryUoW
ÄÄ )
.
ÄÄ) *
BlogCategories
ÄÄ* 8
.
ÄÄ8 9
UpdateOneAsync
ÄÄ9 G
(
ÄÄG H
blogCategory
ÄÄH T
)
ÄÄT U
;
ÄÄU V
}
ÅÅ 	
public
åå 
async
åå 
Task
åå 
<
åå 
BlogRespone
åå %
>
åå% &
GetBlogAsync
åå' 3
(
åå3 4
string
åå4 :
blogId
åå; A
)
ååA B
{
çç 	
var
éé 
blogRespone
éé 
=
éé 
new
éé !
BlogRespone
éé" -
(
éé- .
)
éé. /
;
éé/ 0
var
èè 
blog
èè 
=
èè 
await
èè 
_blogUoW
èè %
.
èè% &
Blogs
èè& +
.
èè+ ,
GetByIdAsync
èè, 8
(
èè8 9
blogId
èè9 ?
)
èè? @
;
èè@ A
if
êê 
(
êê 
blog
êê 
==
êê 
null
êê 
)
êê 
return
êê $
null
êê% )
;
êê) *
blogRespone
íí 
=
íí 
MapperExtensions
íí *
.
íí* +

MapperData
íí+ 5
<
íí5 6
Blog
íí6 :
,
íí: ;
BlogRespone
íí< G
>
ííG H
(
ííH I
blog
ííI M
)
ííM N
;
ííN O
var
ìì 

pathImages
ìì 
=
ìì 
await
ìì "&
GetBase64ImagesBlogAsync
ìì# ;
(
ìì; <
blogId
ìì< B
,
ììB C
true
ììD H
)
ììH I
;
ììI J
if
îî 
(
îî 

pathImages
îî 
!=
îî 
null
îî "
&&
îî# %

pathImages
îî& 0
.
îî0 1
CountExt
îî1 9
(
îî9 :
)
îî: ;
>
îî< =
$num
îî> ?
)
îî? @
{
ïï 
blogRespone
ññ 
.
ññ 
files
ññ !
=
ññ" #

pathImages
ññ$ .
.
ññ. /
	SelectExt
ññ/ 8
(
ññ8 9
x
ññ9 :
=>
ññ; =
new
ññ> A
FileInfo
ññB J
{
ññK L
path
ññM Q
=
ññR S
x
ññT U
}
ññV W
)
ññW X
.
ññX Y
ToList
ññY _
(
ññ_ `
)
ññ` a
;
ñña b
}
óó 
return
ôô 
blogRespone
ôô 
;
ôô 
}
öö 	
public
†† 
async
†† 
Task
†† 
<
†† 
IEnumerable
†† %
<
††% &
Blog
††& *
>
††* +
>
††+ ,
GetBlogsAsync
††- :
(
††: ;
)
††; <
{
°° 	
return
¢¢ 
await
¢¢ 
_blogUoW
¢¢ !
.
¢¢! "
Blogs
¢¢" '
.
¢¢' (
GetAllAsync
¢¢( 3
(
¢¢3 4
)
¢¢4 5
;
¢¢5 6
}
££ 	
public
™™ 
async
™™ 
Task
™™ 
<
™™ 
Pagging
™™ !
<
™™! "
BlogRespone
™™" -
>
™™- .
>
™™. /"
GetBlogsPaggingAsync
™™0 D
(
™™D E

Pagination
™™E O

pagination
™™P Z
)
™™Z [
{
´´ 	
var
¨¨ 

pageResult
¨¨ 
=
¨¨ 
new
¨¨  
Pagging
¨¨! (
<
¨¨( )
BlogRespone
¨¨) 4
>
¨¨4 5
(
¨¨5 6
)
¨¨6 7
;
¨¨7 8
try
≠≠ 
{
ÆÆ 
var
ØØ 
blogPage
ØØ 
=
ØØ 
new
ØØ "
Pagging
ØØ# *
<
ØØ* +
Blog
ØØ+ /
>
ØØ/ 0
(
ØØ0 1
)
ØØ1 2
;
ØØ2 3
if
∞∞ 
(
∞∞ 

pagination
∞∞ 
.
∞∞ 
Filter
∞∞ %
.
∞∞% &'
IsNullOrEmptyOrWhiteSpace
∞∞& ?
(
∞∞? @
)
∞∞@ A
)
∞∞A B
{
±± 
blogPage
≤≤ 
=
≤≤ 
await
≤≤ $
_blogUoW
≤≤% -
.
≤≤- .
Blogs
≤≤. 3
.
≤≤3 4
GetPaggingAsync
≤≤4 C
(
≤≤C D

pagination
≤≤D N
)
≤≤N O
;
≤≤O P
}
≥≥ 
else
¥¥ 
{
µµ 
blogPage
∂∂ 
=
∂∂ 
await
∂∂ $
_blogUoW
∂∂% -
.
∂∂- .
Blogs
∂∂. 3
.
∂∂3 4
GetPaggingAsync
∂∂4 C
(
∂∂C D

pagination
∂∂D N
,
∂∂N O
x
∂∂P Q
=>
∂∂R T
x
∂∂U V
.
∂∂V W
title
∂∂W \
.
∂∂\ ]
ContainsText
∂∂] i
(
∂∂i j

pagination
∂∂j t
.
∂∂t u
Filter
∂∂u {
)
∂∂{ |
)
∂∂| }
;
∂∂} ~
}
∑∑ 
if
ππ 
(
ππ 
blogPage
ππ 
!=
ππ 
null
ππ  $
)
ππ$ %
{
∫∫ 

pageResult
ªª 
=
ªª  
new
ªª! $
Pagging
ªª% ,
<
ªª, -
BlogRespone
ªª- 8
>
ªª8 9
{
ºº 
Data
ΩΩ 
=
ΩΩ 
blogPage
ΩΩ '
.
ΩΩ' (
Data
ΩΩ( ,
!=
ΩΩ- /
null
ΩΩ0 4
?
ΩΩ5 6
blogPage
ΩΩ7 ?
.
ΩΩ? @
Data
ΩΩ@ D
.
ΩΩD E
Select
ΩΩE K
(
ΩΩK L
blog
ΩΩL P
=>
ΩΩQ S
MapperExtensions
ΩΩT d
.
ΩΩd e

MapperData
ΩΩe o
<
ΩΩo p
Blog
ΩΩp t
,
ΩΩt u
BlogResponeΩΩv Å
>ΩΩÅ Ç
(ΩΩÇ É
blogΩΩÉ á
)ΩΩá à
)ΩΩà â
.ΩΩâ ä
ToListΩΩä ê
(ΩΩê ë
)ΩΩë í
:ΩΩì î
nullΩΩï ô
,ΩΩô ö
	PageIndex
ææ !
=
ææ" #
blogPage
ææ$ ,
.
ææ, -
	PageIndex
ææ- 6
,
ææ6 7
PageSize
øø  
=
øø! "
blogPage
øø# +
.
øø+ ,
PageSize
øø, 4
,
øø4 5

TotalPages
¿¿ "
=
¿¿# $
blogPage
¿¿% -
.
¿¿- .

TotalPages
¿¿. 8
,
¿¿8 9
TotalRecord
¡¡ #
=
¡¡$ %
blogPage
¡¡& .
.
¡¡. /
TotalRecord
¡¡/ :
}
¬¬ 
;
¬¬ 
if
≈≈ 
(
≈≈ 

pageResult
≈≈ "
.
≈≈" #
Data
≈≈# '
!=
≈≈( *
null
≈≈+ /
&&
≈≈0 2

pageResult
≈≈3 =
.
≈≈= >
Data
≈≈> B
.
≈≈B C
CountExt
≈≈C K
(
≈≈K L
)
≈≈L M
>
≈≈N O
$num
≈≈P Q
)
≈≈Q R
{
∆∆ 
var
«« 
blogs
«« !
=
««" #

pageResult
««$ .
.
««. /
Data
««/ 3
;
««3 4
for
»» 
(
»» 
int
»»  
index
»»! &
=
»»' (
$num
»») *
;
»»* +
index
»», 1
<
»»2 3

pageResult
»»4 >
.
»»> ?
Data
»»? C
.
»»C D
CountExt
»»D L
(
»»L M
)
»»M N
;
»»N O
index
»»P U
++
»»U W
)
»»W X
{
…… 
var
   
blog
    $
=
  % &

pageResult
  ' 1
.
  1 2
Data
  2 6
[
  6 7
index
  7 <
]
  < =
;
  = >
if
ÀÀ 
(
ÀÀ  
blog
ÀÀ  $
.
ÀÀ$ %
files
ÀÀ% *
==
ÀÀ+ -
null
ÀÀ. 2
)
ÀÀ2 3
blog
ÀÀ4 8
.
ÀÀ8 9
files
ÀÀ9 >
=
ÀÀ? @
new
ÀÀA D
List
ÀÀE I
<
ÀÀI J
FileInfo
ÀÀJ R
>
ÀÀR S
(
ÀÀS T
)
ÀÀT U
;
ÀÀU V
var
ÃÃ 
base64Images
ÃÃ  ,
=
ÃÃ- .
await
ÃÃ/ 4&
GetBase64ImagesBlogAsync
ÃÃ5 M
(
ÃÃM N
blog
ÃÃN R
.
ÃÃR S
id
ÃÃS U
)
ÃÃU V
;
ÃÃV W
if
ÕÕ 
(
ÕÕ  
base64Images
ÕÕ  ,
!=
ÕÕ- /
null
ÕÕ0 4
&&
ÕÕ5 7
base64Images
ÕÕ8 D
.
ÕÕD E
CountExt
ÕÕE M
(
ÕÕM N
)
ÕÕN O
>
ÕÕP Q
$num
ÕÕR S
)
ÕÕS T
{
ŒŒ 
blog
œœ  $
.
œœ$ %
files
œœ% *
=
œœ+ ,
base64Images
œœ- 9
.
œœ9 :
	SelectExt
œœ: C
(
œœC D
x
œœD E
=>
œœF H
new
œœI L
FileInfo
œœM U
{
œœV W
path
œœX \
=
œœ] ^
x
œœ_ `
}
œœa b
)
œœb c
.
œœc d
ToList
œœd j
(
œœj k
)
œœk l
;
œœl m
}
–– 

pageResult
—— &
.
——& '
Data
——' +
[
——+ ,
index
——, 1
]
——1 2
.
——2 3
files
——3 8
=
——9 :
blog
——; ?
.
——? @
files
——@ E
;
——E F
}
““ 
}
‘‘ 
}
’’ 
}
÷÷ 
catch
◊◊ 
(
◊◊ 
	Exception
◊◊ 
ex
◊◊ 
)
◊◊  
{
ÿÿ 
}
ŸŸ 
return
€€ 

pageResult
€€ 
;
€€ 
}
‹‹ 	
public
„„ 
async
„„ 
Task
„„ 
<
„„ 
bool
„„ 
>
„„ 
InsertBlogAsync
„„  /
(
„„/ 0
BlogRequest
„„0 ;
request
„„< C
)
„„C D
{
‰‰ 	
try
ÂÂ 
{
ÊÊ 
var
ÁÁ 
blog
ÁÁ 
=
ÁÁ 
(
ÁÁ 
Blog
ÁÁ  
)
ÁÁ  !
request
ÁÁ! (
;
ÁÁ( )
var
ËË 

blogInsert
ËË 
=
ËË  
await
ËË! &
_blogUoW
ËË' /
.
ËË/ 0
Blogs
ËË0 5
.
ËË5 6
InsertOneAsync
ËË6 D
(
ËËD E
blog
ËËE I
)
ËËI J
;
ËËJ K
if
ÍÍ 
(
ÍÍ 

blogInsert
ÍÍ 
!=
ÍÍ !
null
ÍÍ" &
)
ÍÍ& '
{
ÎÎ 
if
ÏÏ 
(
ÏÏ 
request
ÏÏ 
.
ÏÏ  
files
ÏÏ  %
!=
ÏÏ& (
null
ÏÏ) -
&&
ÏÏ. 0
request
ÏÏ1 8
.
ÏÏ8 9
files
ÏÏ9 >
.
ÏÏ> ?
CountExt
ÏÏ? G
(
ÏÏG H
)
ÏÏH I
>
ÏÏJ K
$num
ÏÏL M
)
ÏÏM N
{
ÌÌ 
await
ÓÓ 
InsertImagesAsync
ÓÓ /
(
ÓÓ/ 0
request
ÓÓ0 7
.
ÓÓ7 8
files
ÓÓ8 =
,
ÓÓ= >
request
ÓÓ? F
.
ÓÓF G
id
ÓÓG I
)
ÓÓI J
;
ÓÓJ K
}
ÔÔ 
}
 
return
ÒÒ 

blogInsert
ÒÒ !
!=
ÒÒ" $
null
ÒÒ% )
;
ÒÒ) *
}
ÚÚ 
catch
ÛÛ 
(
ÛÛ 
	Exception
ÛÛ 
ex
ÛÛ 
)
ÛÛ  
{
ÙÙ 
return
ıı 
false
ıı 
;
ıı 
}
ˆˆ 
}
˜˜ 	
public
ˇˇ 
async
ˇˇ 
Task
ˇˇ 
<
ˇˇ 
bool
ˇˇ 
>
ˇˇ 
UpdateBlogAsync
ˇˇ  /
(
ˇˇ/ 0
BlogRequest
ˇˇ0 ;
blogRequest
ˇˇ< G
)
ˇˇG H
{
ÄÄ 	
var
ÅÅ 
blog
ÅÅ 
=
ÅÅ 
MapperExtensions
ÅÅ '
.
ÅÅ' (

MapperData
ÅÅ( 2
<
ÅÅ2 3
BlogRequest
ÅÅ3 >
,
ÅÅ> ?
Blog
ÅÅ@ D
>
ÅÅD E
(
ÅÅE F
blogRequest
ÅÅF Q
)
ÅÅQ R
;
ÅÅR S
var
ÇÇ 

blogUpdate
ÇÇ 
=
ÇÇ 
await
ÇÇ "
_blogUoW
ÇÇ# +
.
ÇÇ+ ,
Blogs
ÇÇ, 1
.
ÇÇ1 2
UpdateOneAsync
ÇÇ2 @
(
ÇÇ@ A
blog
ÇÇA E
)
ÇÇE F
;
ÇÇF G
if
ÉÉ 
(
ÉÉ 
!
ÉÉ 

blogUpdate
ÉÉ 
)
ÉÉ 
return
ÉÉ #
false
ÉÉ$ )
;
ÉÉ) *
if
ÜÜ 
(
ÜÜ 
blogRequest
ÜÜ 
.
ÜÜ 
files
ÜÜ !
==
ÜÜ" $
null
ÜÜ% )
||
ÜÜ* ,
blogRequest
ÜÜ- 8
.
ÜÜ8 9
files
ÜÜ9 >
.
ÜÜ> ?
CountExt
ÜÜ? G
(
ÜÜG H
)
ÜÜH I
<=
ÜÜJ L
$num
ÜÜM N
)
ÜÜN O
return
ÜÜP V

blogUpdate
ÜÜW a
;
ÜÜa b
var
àà 
files
àà 
=
àà 
blogRequest
àà #
.
àà# $
files
àà$ )
.
àà) *
Where
àà* /
(
àà/ 0
x
àà0 1
=>
àà2 4
!
àà5 6
x
àà6 7
.
àà7 8
path
àà8 <
.
àà< ='
IsNullOrEmptyOrWhiteSpace
àà= V
(
ààV W
)
ààW X
)
ààX Y
.
ààY Z
ToList
ààZ `
(
àà` a
)
ààa b
;
ààb c
var
ää 
images
ää 
=
ää 
await
ää 
	_imageUoW
ää (
.
ää( )
Images
ää) /
.
ää/ 0
GetAllAsync
ää0 ;
(
ää; <
x
ää< =
=>
ää> @
x
ääA B
.
ääB C
blog_id
ääC J
==
ääK M
blogRequest
ääN Y
.
ääY Z
id
ääZ \
)
ää\ ]
;
ää] ^
if
åå 
(
åå 
images
åå 
.
åå 
CountExt
åå 
(
åå  
)
åå  !
>
åå" #
$num
åå$ %
)
åå% &
{
çç 
var
éé 
deleteImages
éé  
=
éé! "
await
éé# (#
DeleteImagesBlogAsync
éé) >
(
éé> ?
blogRequest
éé? J
.
ééJ K
id
ééK M
,
ééM N
images
ééO U
.
ééU V
	SelectExt
ééV _
(
éé_ `
x
éé` a
=>
ééb d
x
éée f
.
ééf g
path
éég k
)
éék l
.
éél m
ToList
éém s
(
éés t
)
éét u
)
ééu v
;
éév w
if
èè 
(
èè 
deleteImages
èè  
)
èè  !
{
êê 
await
ëë 
InsertImagesAsync
ëë +
(
ëë+ ,
blogRequest
ëë, 7
.
ëë7 8
files
ëë8 =
,
ëë= >
blogRequest
ëë? J
.
ëëJ K
id
ëëK M
)
ëëM N
;
ëëN O
}
íí 
}
ìì 
else
îî 
{
ïï 
await
ññ 
InsertImagesAsync
ññ '
(
ññ' (
blogRequest
ññ( 3
.
ññ3 4
files
ññ4 9
,
ññ9 :
blogRequest
ññ; F
.
ññF G
id
ññG I
)
ññI J
;
ññJ K
}
óó 
return
ôô 

blogUpdate
ôô 
;
ôô 
}
öö 	
public
°° 
async
°° 
Task
°° 
<
°° 
bool
°° 
>
°° 
DeleteBlogAsync
°°  /
(
°°/ 0
Blog
°°0 4
blog
°°5 9
)
°°9 :
{
¢¢ 	
var
§§ 
images
§§ 
=
§§ 
await
§§ 
	_imageUoW
§§ (
.
§§( )
Images
§§) /
.
§§/ 0
GetAllAsync
§§0 ;
(
§§; <
x
§§< =
=>
§§> @
x
§§A B
.
§§B C
blog_id
§§C J
==
§§K M
blog
§§N R
.
§§R S
id
§§S U
)
§§U V
;
§§V W
if
•• 
(
•• 
images
•• 
.
•• 
CountExt
•• 
(
••  
)
••  !
>
••" #
$num
••$ %
)
••% &
{
¶¶ 
await
ßß #
DeleteImagesBlogAsync
ßß +
(
ßß+ ,
blog
ßß, 0
.
ßß0 1
id
ßß1 3
,
ßß3 4
images
ßß5 ;
.
ßß; <
	SelectExt
ßß< E
(
ßßE F
x
ßßF G
=>
ßßH J
x
ßßK L
.
ßßL M
path
ßßM Q
)
ßßQ R
.
ßßR S
ToList
ßßS Y
(
ßßY Z
)
ßßZ [
)
ßß[ \
;
ßß\ ]
}
®® 
return
™™ 
await
™™ 
_blogUoW
™™ !
.
™™! "
Blogs
™™" '
.
™™' (
DeleteOneAsync
™™( 6
(
™™6 7
blog
™™7 ;
)
™™; <
;
™™< =
}
´´ 	
public
ÆÆ 
async
ÆÆ 
Task
ÆÆ 
<
ÆÆ 
bool
ÆÆ 
>
ÆÆ 
DeleteBlogsAsync
ÆÆ  0
(
ÆÆ0 1
List
ÆÆ1 5
<
ÆÆ5 6
Blog
ÆÆ6 :
>
ÆÆ: ;
blogs
ÆÆ< A
)
ÆÆA B
{
ØØ 	
try
∞∞ 
{
±± 
if
≤≤ 
(
≤≤ 
blogs
≤≤ 
.
≤≤ 
CountExt
≤≤ "
(
≤≤" #
)
≤≤# $
<=
≤≤% '
$num
≤≤( )
)
≤≤) *
return
≤≤+ 1
false
≤≤2 7
;
≤≤7 8
foreach
¥¥ 
(
¥¥ 
var
¥¥ 
blog
¥¥ !
in
¥¥" $
blogs
¥¥% *
)
¥¥* +
{
µµ 
var
∑∑ 
images
∑∑ 
=
∑∑  
await
∑∑! &
	_imageUoW
∑∑' 0
.
∑∑0 1
Images
∑∑1 7
.
∑∑7 8
GetAllAsync
∑∑8 C
(
∑∑C D
x
∑∑D E
=>
∑∑F H
x
∑∑I J
.
∑∑J K
blog_id
∑∑K R
==
∑∑S U
blog
∑∑V Z
.
∑∑Z [
id
∑∑[ ]
)
∑∑] ^
;
∑∑^ _
if
∏∏ 
(
∏∏ 
images
∏∏ 
.
∏∏ 
CountExt
∏∏ '
(
∏∏' (
)
∏∏( )
>
∏∏* +
$num
∏∏, -
)
∏∏- .
{
ππ 
await
∫∫ #
DeleteImagesBlogAsync
∫∫ 3
(
∫∫3 4
blog
∫∫4 8
.
∫∫8 9
id
∫∫9 ;
,
∫∫; <
images
∫∫= C
.
∫∫C D
	SelectExt
∫∫D M
(
∫∫M N
x
∫∫N O
=>
∫∫P R
x
∫∫S T
.
∫∫T U
path
∫∫U Y
)
∫∫Y Z
.
∫∫Z [
ToList
∫∫[ a
(
∫∫a b
)
∫∫b c
)
∫∫c d
;
∫∫d e
}
ªª 
}
ºº 
return
ΩΩ 
await
ΩΩ 
_blogUoW
ΩΩ %
.
ΩΩ% &
Blogs
ΩΩ& +
.
ΩΩ+ ,
DeleteManyAsync
ΩΩ, ;
(
ΩΩ; <
blogs
ΩΩ< A
)
ΩΩA B
;
ΩΩB C
}
ææ 
catch
øø 
(
øø 
	Exception
øø 
ex
øø 
)
øø  
{
¿¿ 
return
¡¡ 
false
¡¡ 
;
¡¡ 
}
¬¬ 
}
√√ 	
private
   
async
   
Task
   
<
   
List
   
<
    
string
    &
>
  & '
>
  ' ($
GetPathImagesBlogAsync
  ) ?
(
  ? @
string
  @ F
blogId
  G M
)
  M N
{
ÀÀ 	
try
ÃÃ 
{
ÕÕ 
var
œœ 
cachedKeyImages
œœ #
=
œœ$ %$
GetKeyCachedBlogImages
œœ& <
(
œœ< =
blogId
œœ= C
)
œœC D
;
œœD E
var
–– 
pathDbImages
––  
=
––! "
await
––# (
_cached
––) 0
.
––0 1
GetAsync
––1 9
<
––9 :
List
––: >
<
––> ?
string
––? E
>
––E F
>
––F G
(
––G H
cachedKeyImages
––H W
)
––W X
;
––X Y
if
““ 
(
““ 
pathDbImages
““  
==
““! #
null
““$ (
||
““) +
pathDbImages
““, 8
.
““8 9
CountExt
““9 A
(
““A B
)
““B C
<=
““D F
$num
““G H
)
““H I
{
”” 
var
‘‘ 
images
‘‘ 
=
‘‘  
await
‘‘! &
	_imageUoW
‘‘' 0
.
‘‘0 1
Images
‘‘1 7
.
‘‘7 8
GetAllAsync
‘‘8 C
(
‘‘C D
x
‘‘D E
=>
‘‘F H
x
‘‘I J
.
‘‘J K
blog_id
‘‘K R
==
‘‘S U
blogId
‘‘V \
)
‘‘\ ]
;
‘‘] ^
if
’’ 
(
’’ 
images
’’ 
!=
’’ !
null
’’" &
&&
’’' )
images
’’* 0
.
’’0 1
CountExt
’’1 9
(
’’9 :
)
’’: ;
>
’’< =
$num
’’> ?
)
’’? @
{
÷÷ 
pathDbImages
◊◊ $
=
◊◊% &
images
◊◊' -
.
◊◊- .
	SelectExt
◊◊. 7
(
◊◊7 8
x
◊◊8 9
=>
◊◊: <
x
◊◊= >
.
◊◊> ?
path
◊◊? C
)
◊◊C D
.
◊◊D E
ToList
◊◊E K
(
◊◊K L
)
◊◊L M
;
◊◊M N
}
ÿÿ 
}
ŸŸ 
if
€€ 
(
€€ 
pathDbImages
€€  
==
€€! #
null
€€$ (
||
€€) +
pathDbImages
€€, 8
.
€€8 9
Count
€€9 >
(
€€> ?
)
€€? @
<=
€€A C
$num
€€D E
)
€€E F
return
€€G M
new
€€N Q
List
€€R V
<
€€V W
string
€€W ]
>
€€] ^
(
€€^ _
)
€€_ `
;
€€` a
var
ﬁﬁ 

timeCached
ﬁﬁ 
=
ﬁﬁ  
$num
ﬁﬁ! #
*
ﬁﬁ$ %
$num
ﬁﬁ& (
*
ﬁﬁ) *
$num
ﬁﬁ+ -
;
ﬁﬁ- .
await
ﬂﬂ 
_cached
ﬂﬂ 
.
ﬂﬂ 
SetAsync
ﬂﬂ &
(
ﬂﬂ& '
cachedKeyImages
ﬂﬂ' 6
,
ﬂﬂ6 7
pathDbImages
ﬂﬂ8 D
,
ﬂﬂD E

timeCached
ﬂﬂF P
)
ﬂﬂP Q
;
ﬂﬂQ R
var
·· 
paths
·· 
=
·· 
new
·· 
List
··  $
<
··$ %
string
··% +
>
··+ ,
(
··, -
)
··- .
;
··. /
foreach
„„ 
(
„„ 
var
„„ 
path
„„ !
in
„„" $
pathDbImages
„„% 1
)
„„1 2
{
‰‰ 
var
ÂÂ 
keyPathStorage
ÂÂ &
=
ÂÂ' (
$"
ÂÂ) +
{
ÂÂ+ ,
path
ÂÂ, 0
}
ÂÂ0 1
"
ÂÂ1 2
;
ÂÂ2 3
var
ÊÊ 
pathStorage
ÊÊ #
=
ÊÊ$ %
await
ÊÊ& +
_cached
ÊÊ, 3
.
ÊÊ3 4
GetAsync
ÊÊ4 <
<
ÊÊ< =
string
ÊÊ= C
>
ÊÊC D
(
ÊÊD E
keyPathStorage
ÊÊE S
)
ÊÊS T
;
ÊÊT U
if
ÈÈ 
(
ÈÈ 
!
ÈÈ 
pathStorage
ÈÈ $
.
ÈÈ$ %'
IsNullOrEmptyOrWhiteSpace
ÈÈ% >
(
ÈÈ> ?
)
ÈÈ? @
)
ÈÈ@ A
{
ÍÍ 
paths
ÎÎ 
.
ÎÎ 
Add
ÎÎ !
(
ÎÎ! "
pathStorage
ÎÎ" -
)
ÎÎ- .
;
ÎÎ. /
}
ÏÏ 
else
ÌÌ 
{
ÓÓ 
pathStorage
 #
=
$ %
await
& +
_storageClient
, :
.
: ;&
GetPathFileDownloadAsync
; S
(
S T
path
T X
,
X Y

timeCached
Z d
)
d e
;
e f
if
ÒÒ 
(
ÒÒ 
!
ÒÒ 
pathStorage
ÒÒ (
.
ÒÒ( )'
IsNullOrEmptyOrWhiteSpace
ÒÒ) B
(
ÒÒB C
)
ÒÒC D
)
ÒÒD E
paths
ÒÒF K
.
ÒÒK L
Add
ÒÒL O
(
ÒÒO P
pathStorage
ÒÒP [
)
ÒÒ[ \
;
ÒÒ\ ]
await
ÛÛ 
_cached
ÛÛ %
.
ÛÛ% &
SetAsync
ÛÛ& .
(
ÛÛ. /
keyPathStorage
ÛÛ/ =
,
ÛÛ= >
pathStorage
ÛÛ? J
,
ÛÛJ K

timeCached
ÛÛL V
)
ÛÛV W
;
ÛÛW X
}
ÙÙ 
}
ıı 
return
˜˜ 
paths
˜˜ 
;
˜˜ 
}
¯¯ 
catch
˘˘ 
(
˘˘ 
	Exception
˘˘ 
ex
˘˘ 
)
˘˘  
{
˙˙ 
return
˚˚ 
new
˚˚ 
List
˚˚ 
<
˚˚  
string
˚˚  &
>
˚˚& '
(
˚˚' (
)
˚˚( )
;
˚˚) *
}
¸¸ 
}
˝˝ 	
private
ÑÑ 
async
ÑÑ 
Task
ÑÑ 
<
ÑÑ 
List
ÑÑ 
<
ÑÑ  
string
ÑÑ  &
>
ÑÑ& '
>
ÑÑ' (&
GetBase64ImagesBlogAsync
ÑÑ) A
(
ÑÑA B
string
ÑÑB H
blogId
ÑÑI O
,
ÑÑO P
bool
ÑÑQ U
isGetAllImage
ÑÑV c
=
ÑÑd e
false
ÑÑf k
)
ÑÑk l
{
ÖÖ 	
try
ÜÜ 
{
áá 
var
ââ 
cachedKeyImages
ââ #
=
ââ$ %$
GetKeyCachedBlogImages
ââ& <
(
ââ< =
blogId
ââ= C
)
ââC D
;
ââD E
var
ää 
pathDbImages
ää  
=
ää! "
await
ää# (
_cached
ää) 0
.
ää0 1
GetAsync
ää1 9
<
ää9 :
List
ää: >
<
ää> ?
string
ää? E
>
ääE F
>
ääF G
(
ääG H
cachedKeyImages
ääH W
)
ääW X
;
ääX Y
var
ãã 
idImages
ãã 
=
ãã 
new
ãã "
List
ãã# '
<
ãã' (
string
ãã( .
>
ãã. /
(
ãã/ 0
)
ãã0 1
;
ãã1 2
if
éé 
(
éé 
pathDbImages
éé  
==
éé! #
null
éé$ (
||
éé) +
pathDbImages
éé, 8
.
éé8 9
CountExt
éé9 A
(
ééA B
)
ééB C
<=
ééD F
$num
ééG H
)
ééH I
{
èè 
var
êê 
images
êê 
=
êê  
await
êê! &
	_imageUoW
êê' 0
.
êê0 1
Images
êê1 7
.
êê7 8
GetAllAsync
êê8 C
(
êêC D
x
êêD E
=>
êêF H
x
êêI J
.
êêJ K
blog_id
êêK R
==
êêS U
blogId
êêV \
)
êê\ ]
;
êê] ^
if
ëë 
(
ëë 
images
ëë 
!=
ëë !
null
ëë" &
&&
ëë' )
images
ëë* 0
.
ëë0 1
CountExt
ëë1 9
(
ëë9 :
)
ëë: ;
>
ëë< =
$num
ëë> ?
)
ëë? @
{
íí 
pathDbImages
ìì $
=
ìì% &
images
ìì' -
.
ìì- .
	SelectExt
ìì. 7
(
ìì7 8
x
ìì8 9
=>
ìì: <
x
ìì= >
.
ìì> ?
path
ìì? C
)
ììC D
.
ììD E
ToList
ììE K
(
ììK L
)
ììL M
;
ììM N
idImages
îî  
=
îî! "
images
îî# )
.
îî) *
	SelectExt
îî* 3
(
îî3 4
x
îî4 5
=>
îî6 8
x
îî9 :
.
îî: ;
id
îî; =
)
îî= >
.
îî> ?
ToList
îî? E
(
îîE F
)
îîF G
;
îîG H
}
ïï 
}
ññ 
if
òò 
(
òò 
pathDbImages
òò  
==
òò! #
null
òò$ (
||
òò) +
pathDbImages
òò, 8
.
òò8 9
Count
òò9 >
(
òò> ?
)
òò? @
<=
òòA C
$num
òòD E
)
òòE F
return
òòG M
new
òòN Q
List
òòR V
<
òòV W
string
òòW ]
>
òò] ^
(
òò^ _
)
òò_ `
;
òò` a
var
õõ 

timeCached
õõ 
=
õõ  
$num
õõ! #
*
õõ$ %
$num
õõ& (
*
õõ) *
$num
õõ+ -
;
õõ- .
await
úú 
_cached
úú 
.
úú 
SetAsync
úú &
(
úú& '
cachedKeyImages
úú' 6
,
úú6 7
pathDbImages
úú8 D
,
úúD E

timeCached
úúF P
)
úúP Q
;
úúQ R
var
ûû 
base64Images
ûû  
=
ûû! "
new
ûû# &
List
ûû' +
<
ûû+ ,
string
ûû, 2
>
ûû2 3
(
ûû3 4
)
ûû4 5
;
ûû5 6
if
†† 
(
†† 
isGetAllImage
†† !
)
††! "
{
°° 
foreach
¢¢ 
(
¢¢ 
var
¢¢  
path
¢¢! %
in
¢¢& (
pathDbImages
¢¢) 5
)
¢¢5 6
{
££ 
var
§§ 
	byteImage
§§ %
=
§§& '
await
§§( -
_storageClient
§§. <
.
§§< =
DownloadFileAsync
§§= N
(
§§N O
path
§§O S
)
§§S T
;
§§T U
if
•• 
(
•• 
	byteImage
•• %
!=
••& (
null
••) -
&&
••. 0
	byteImage
••1 :
.
••: ;
Length
••; A
>
••B C
$num
••D E
)
••E F
{
¶¶ 
var
ßß 
base64Image
ßß  +
=
ßß, -
Convert
ßß. 5
.
ßß5 6
ToBase64String
ßß6 D
(
ßßD E
	byteImage
ßßE N
)
ßßN O
;
ßßO P
base64Image
®® '
=
®®( )
$"
®®* ,
$str
®®, C
{
®®C D
base64Image
®®D O
}
®®O P
"
®®P Q
;
®®Q R
if
©© 
(
©©  
!
©©  !
base64Image
©©! ,
.
©©, -'
IsNullOrEmptyOrWhiteSpace
©©- F
(
©©F G
)
©©G H
)
©©H I
base64Images
©©J V
.
©©V W
Add
©©W Z
(
©©Z [
base64Image
©©[ f
)
©©f g
;
©©g h
}
™™ 
}
´´ 
}
¨¨ 
else
≠≠ 
{
ÆÆ 
var
±± 
random
±± 
=
±±  
new
±±! $
Random
±±% +
(
±±+ ,
)
±±, -
;
±±- .
int
≤≤ 
imageRandom
≤≤ #
=
≤≤$ %
random
≤≤& ,
.
≤≤, -
Next
≤≤- 1
(
≤≤1 2
pathDbImages
≤≤2 >
.
≤≤> ?
CountExt
≤≤? G
(
≤≤G H
)
≤≤H I
)
≤≤I J
;
≤≤J K
var
≥≥ 
	byteImage
≥≥ !
=
≥≥" #
await
≥≥$ )
_storageClient
≥≥* 8
.
≥≥8 9
DownloadFileAsync
≥≥9 J
(
≥≥J K
pathDbImages
≥≥K W
[
≥≥W X
imageRandom
≥≥X c
]
≥≥c d
)
≥≥d e
;
≥≥e f
if
¥¥ 
(
¥¥ 
	byteImage
¥¥ !
!=
¥¥" $
null
¥¥% )
&&
¥¥* ,
	byteImage
¥¥- 6
.
¥¥6 7
Length
¥¥7 =
>
¥¥> ?
$num
¥¥@ A
)
¥¥A B
{
µµ 
var
∂∂ 
base64Image
∂∂ '
=
∂∂( )
Convert
∂∂* 1
.
∂∂1 2
ToBase64String
∂∂2 @
(
∂∂@ A
	byteImage
∂∂A J
)
∂∂J K
;
∂∂K L
base64Image
∑∑ #
=
∑∑$ %
$"
∑∑& (
$str
∑∑( ?
{
∑∑? @
base64Image
∑∑@ K
}
∑∑K L
"
∑∑L M
;
∑∑M N
if
∏∏ 
(
∏∏ 
!
∏∏ 
base64Image
∏∏ (
.
∏∏( )'
IsNullOrEmptyOrWhiteSpace
∏∏) B
(
∏∏B C
)
∏∏C D
)
∏∏D E
base64Images
∏∏F R
.
∏∏R S
Add
∏∏S V
(
∏∏V W
base64Image
∏∏W b
)
∏∏b c
;
∏∏c d
}
ππ 
}
∫∫ 
return
ªª 
base64Images
ªª #
;
ªª# $
}
ºº 
catch
ΩΩ 
(
ΩΩ 
	Exception
ΩΩ 
ex
ΩΩ 
)
ΩΩ  
{
ææ 
return
øø 
new
øø 
List
øø 
<
øø  
string
øø  &
>
øø& '
(
øø' (
)
øø( )
;
øø) *
}
¿¿ 
}
¡¡ 	
private
¬¬ 
async
¬¬ 
Task
¬¬ 
<
¬¬ 
List
¬¬ 
<
¬¬  
string
¬¬  &
>
¬¬& '
>
¬¬' ('
GetPathImagesByPathsAsync
¬¬) B
(
¬¬B C
List
¬¬C G
<
¬¬G H
string
¬¬H N
>
¬¬N O
paths
¬¬P U
)
¬¬U V
{
√√ 	
try
ƒƒ 
{
≈≈ 
if
∆∆ 
(
∆∆ 
paths
∆∆ 
==
∆∆ 
null
∆∆ !
||
∆∆" $
paths
∆∆% *
.
∆∆* +
CountExt
∆∆+ 3
(
∆∆3 4
)
∆∆4 5
<=
∆∆6 8
$num
∆∆9 :
)
∆∆: ;
return
∆∆< B
new
∆∆C F
List
∆∆G K
<
∆∆K L
string
∆∆L R
>
∆∆R S
(
∆∆S T
)
∆∆T U
;
∆∆U V
var
«« 
pathsStorage
««  
=
««! "
new
««# &
List
««' +
<
««+ ,
string
««, 2
>
««2 3
(
««3 4
)
««4 5
;
««5 6
foreach
…… 
(
…… 
var
…… 
path
…… !
in
……" $
paths
……% *
)
……* +
{
   
var
ÀÀ 

timeCached
ÀÀ "
=
ÀÀ# $
$num
ÀÀ% '
*
ÀÀ( )
$num
ÀÀ* ,
*
ÀÀ- .
$num
ÀÀ/ 1
;
ÀÀ1 2
var
ÕÕ 
pathStorage
ÕÕ #
=
ÕÕ$ %
await
ÕÕ& +
_storageClient
ÕÕ, :
.
ÕÕ: ;&
GetPathFileDownloadAsync
ÕÕ; S
(
ÕÕS T
path
ÕÕT X
,
ÕÕX Y

timeCached
ÕÕZ d
)
ÕÕd e
;
ÕÕe f
if
ŒŒ 
(
ŒŒ 
!
ŒŒ 
pathStorage
ŒŒ $
.
ŒŒ$ %'
IsNullOrEmptyOrWhiteSpace
ŒŒ% >
(
ŒŒ> ?
)
ŒŒ? @
)
ŒŒ@ A
pathsStorage
ŒŒB N
.
ŒŒN O
Add
ŒŒO R
(
ŒŒR S
pathStorage
ŒŒS ^
)
ŒŒ^ _
;
ŒŒ_ `
}
œœ 
return
—— 
pathsStorage
—— #
;
——# $
}
““ 
catch
”” 
(
”” 
	Exception
”” 
ex
”” 
)
””  
{
‘‘ 
return
’’ 
new
’’ 
List
’’ 
<
’’  
string
’’  &
>
’’& '
(
’’' (
)
’’( )
;
’’) *
}
÷÷ 
}
◊◊ 	
private
ﬂﬂ 
async
ﬂﬂ 
Task
ﬂﬂ 
<
ﬂﬂ 
bool
ﬂﬂ 
>
ﬂﬂ  
InsertImagesAsync
ﬂﬂ! 2
(
ﬂﬂ2 3
List
ﬂﬂ3 7
<
ﬂﬂ7 8
FileInfo
ﬂﬂ8 @
>
ﬂﬂ@ A
	fileInfos
ﬂﬂB K
,
ﬂﬂK L
string
ﬂﬂM S
blogId
ﬂﬂT Z
)
ﬂﬂZ [
{
‡‡ 	
try
·· 
{
‚‚ 
if
„„ 
(
„„ 
	fileInfos
„„ 
.
„„ 
CountExt
„„ &
(
„„& '
)
„„' (
<=
„„) +
$num
„„, -
)
„„- .
return
„„/ 5
false
„„6 ;
;
„„; <
var
‰‰ 
imagesInsert
‰‰  
=
‰‰! "
	fileInfos
‰‰# ,
.
‰‰, -
Select
‰‰- 3
(
‰‰3 4
(
‰‰4 5
x
‰‰5 6
,
‰‰6 7
index
‰‰8 =
)
‰‰= >
=>
‰‰? A
new
‰‰B E
Image
‰‰F K
(
‰‰K L
)
‰‰L M
{
ÂÂ 
path
ÊÊ 
=
ÊÊ 
GlobalConstant
ÊÊ )
.
ÊÊ) *
GetFullPathBlog
ÊÊ* 9
(
ÊÊ9 :
$"
ÊÊ: <
{
ÊÊ< =
blogId
ÊÊ= C
}
ÊÊC D
$str
ÊÊD E
{
ÊÊE F
Guid
ÊÊF J
.
ÊÊJ K
NewGuid
ÊÊK R
(
ÊÊR S
)
ÊÊS T
}
ÊÊT U
"
ÊÊU V
,
ÊÊV W
FileExtensions
ÊÊX f
.
ÊÊf g
GetFileExtention
ÊÊg w
(
ÊÊw x
FileTypeÊÊx Ä
.ÊÊÄ Å
ImageÊÊÅ Ü
)ÊÊÜ á
)ÊÊá à
,ÊÊà â
blog_id
ÁÁ 
=
ÁÁ 
blogId
ÁÁ $
,
ÁÁ$ %
	is_picked
ËË 
=
ËË 
true
ËË  $
}
ÈÈ 
)
ÈÈ 
.
ÈÈ 
ToList
ÈÈ 
(
ÈÈ 
)
ÈÈ 
;
ÈÈ 
var
ÎÎ 
insertImage
ÎÎ 
=
ÎÎ  !
await
ÎÎ" '
	_imageUoW
ÎÎ( 1
.
ÎÎ1 2
Images
ÎÎ2 8
.
ÎÎ8 9
InsertManyAsync
ÎÎ9 H
(
ÎÎH I
imagesInsert
ÎÎI U
)
ÎÎU V
;
ÎÎV W
if
ÏÏ 
(
ÏÏ 
insertImage
ÏÏ 
.
ÏÏ  
CountExt
ÏÏ  (
(
ÏÏ( )
)
ÏÏ) *
>
ÏÏ+ ,
$num
ÏÏ- .
)
ÏÏ. /
{
ÌÌ 
for
ÓÓ 
(
ÓÓ 
int
ÓÓ 
index
ÓÓ "
=
ÓÓ# $
$num
ÓÓ% &
;
ÓÓ& '
index
ÓÓ( -
<
ÓÓ. /
	fileInfos
ÓÓ0 9
.
ÓÓ9 :
CountExt
ÓÓ: B
(
ÓÓB C
)
ÓÓC D
;
ÓÓD E
index
ÓÓF K
++
ÓÓK M
)
ÓÓM N
{
ÔÔ 
var
 
byteFile
 $
=
% &
ConvertExtensions
' 8
.
8 9
ConvertFromBase64
9 J
(
J K
	fileInfos
K T
[
T U
index
U Z
]
Z [
.
[ \
path
\ `
)
` a
;
a b
var
ÒÒ 
insertStorage
ÒÒ )
=
ÒÒ* +
await
ÒÒ, 1
_storageClient
ÒÒ2 @
.
ÒÒ@ A
UploadFileAsync
ÒÒA P
(
ÒÒP Q
imagesInsert
ÒÒQ ]
[
ÒÒ] ^
index
ÒÒ^ c
]
ÒÒc d
.
ÒÒd e
path
ÒÒe i
,
ÒÒi j
byteFile
ÒÒk s
)
ÒÒs t
;
ÒÒt u
if
ÚÚ 
(
ÚÚ 
insertStorage
ÚÚ )
)
ÚÚ) *
{
ÛÛ 
var
ÙÙ 
keyPathStorage
ÙÙ  .
=
ÙÙ/ 0$
GetKeyCachedBlogImages
ÙÙ1 G
(
ÙÙG H
blogId
ÙÙH N
)
ÙÙN O
;
ÙÙO P
await
ˆˆ !
_cached
ˆˆ" )
.
ˆˆ) *
SetAsync
ˆˆ* 2
(
ˆˆ2 3
keyPathStorage
ˆˆ3 A
,
ˆˆA B
insertImage
ˆˆC N
.
ˆˆN O
	SelectExt
ˆˆO X
(
ˆˆX Y
x
ˆˆY Z
=>
ˆˆ[ ]
x
ˆˆ^ _
.
ˆˆ_ `
path
ˆˆ` d
)
ˆˆd e
.
ˆˆe f
ToList
ˆˆf l
(
ˆˆl m
)
ˆˆm n
,
ˆˆn o
$num
ˆˆp r
*
ˆˆs t
$num
ˆˆu w
*
ˆˆx y
$num
ˆˆz |
)
ˆˆ| }
;
ˆˆ} ~
}
˜˜ 
}
¯¯ 
return
˘˘ 
true
˘˘ 
;
˘˘  
}
˙˙ 
return
˚˚ 
false
˚˚ 
;
˚˚ 
}
¸¸ 
catch
˝˝ 
(
˝˝ 
	Exception
˝˝ 
ex
˝˝ 
)
˝˝  
{
˛˛ 
return
ˇˇ 
false
ˇˇ 
;
ˇˇ 
}
ÄÄ 
}
ÅÅ 	
private
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
bool
ÉÉ 
>
ÉÉ  #
DeleteImagesBlogAsync
ÉÉ! 6
(
ÉÉ6 7
string
ÉÉ7 =
blogId
ÉÉ> D
,
ÉÉD E
List
ÉÉF J
<
ÉÉJ K
string
ÉÉK Q
>
ÉÉQ R
paths
ÉÉS X
)
ÉÉX Y
{
ÑÑ 	
try
ÖÖ 
{
ÜÜ 
var
áá 
deleteImages
áá  
=
áá! "
await
áá# (
	_imageUoW
áá) 2
.
áá2 3
Images
áá3 9
.
áá9 :
DeleteManyAsync
áá: I
(
ááI J
x
ááJ K
=>
ááL N
x
ááO P
.
ááP Q
blog_id
ááQ X
==
ááY [
blogId
áá\ b
)
ááb c
;
áác d
if
àà 
(
àà 
deleteImages
àà  
)
àà  !
{
ââ 
var
ãã 
	keyCached
ãã !
=
ãã" #$
GetKeyCachedBlogImages
ãã$ :
(
ãã: ;
blogId
ãã; A
)
ããA B
;
ããB C
await
åå 
_cached
åå !
.
åå! "
RemoveAsync
åå" -
(
åå- .
	keyCached
åå. 7
)
åå7 8
;
åå8 9
if
çç 
(
çç 
paths
çç 
.
çç 
CountExt
çç &
(
çç& '
)
çç' (
>
çç) *
$num
çç+ ,
)
çç, -
{
éé 
foreach
èè 
(
èè  !
var
èè! $
path
èè% )
in
èè* ,
paths
èè- 2
)
èè2 3
{
êê 
await
íí !
_storageClient
íí" 0
.
íí0 1$
DeleteFileStorageAsync
íí1 G
(
ííG H
path
ííH L
)
ííL M
;
ííM N
}
ìì 
}
îî 
return
ïï 
true
ïï 
;
ïï  
}
ññ 
}
óó 
catch
òò 
(
òò 
	Exception
òò 
ex
òò 
)
òò  
{
ôô 
}
öö 
return
õõ 
false
õõ 
;
õõ 
}
úú 	
private
ûû 
string
ûû $
GetKeyCachedBlogImages
ûû -
(
ûû- .
string
ûû. 4
blogId
ûû5 ;
)
ûû; <
=>
ûû= ?
$"
ûû@ B
$str
ûûB N
{
ûûN O
blogId
ûûO U
}
ûûU V
"
ûûV W
;
ûûW X
private
üü 
string
üü *
GetKeyCachedBlogImagesBase64
üü 3
(
üü3 4
string
üü4 :
blogId
üü; A
)
üüA B
=>
üüC E
GlobalConstant
üüF T
.
üüT U
GetFullPathBlog
üüU d
(
üüd e
$"
üüe g
{
üüg h
blogId
üüh n
}
üün o
$str
üüo p
{
üüp q
Guid
üüq u
.
üüu v
NewGuid
üüv }
(
üü} ~
)
üü~ 
}üü Ä
"üüÄ Å
,üüÅ Ç
FileExtensionsüüÉ ë
.üüë í 
GetFileExtentionüüí ¢
(üü¢ £
FileTypeüü£ ´
.üü´ ¨
Imageüü¨ ±
)üü± ≤
)üü≤ ≥
;üü≥ ¥
}
££ 
}§§ Ë
nC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Customers\CustomerService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
CustomerService  
:! "
BaseDomainService# 4
<4 5
CustomerService5 D
>D E
,E F
ICustomerServiceG W
{ 
private 
readonly 
ICustomerUoW %
_customerUoW& 2
;2 3
private 
readonly 
IRedisCached %
_cached& -
;- .
private 
readonly 
AppSettings $
_appSettings% 1
;1 2
public 
CustomerService 
( 
IServiceProvider /
serviceProvider0 ?
)? @
:A B
baseC G
(G H
serviceProviderH W
)W X
{ 	
_customerUoW 
= 
serviceProvider *
.* +
GetRequiredService+ =
<= >
ICustomerUoW> J
>J K
(K L
)L M
;M N
_cached 
= 
serviceProvider %
.% &
GetRequiredService& 8
<8 9
IRedisCached9 E
>E F
(F G
)G H
;H I
_appSettings 
= 
new 
AppSettings *
(* +
)+ ,
;, -
} 	
}%% 
}&& É
oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Dowload\ConfigColumnsExcel.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
. 
Dowload &
{ 
public 

class 
ConfigColumnsExcel #
{ 
} 
} º
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Dowload\DowloadService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
DowloadService 
:  !
BaseDomainService" 3
<3 4
CustomerService4 C
>C D
,D E
IDownloadServiceF V
{ 
private 
readonly 
ICustomerUoW %
_customerUoW& 2
;2 3
public 
DowloadService 
( 
IServiceProvider .
serviceProvider/ >
)> ?
:@ A
baseB F
(F G
serviceProviderG V
)V W
{ 	
_customerUoW 
= 
serviceProvider *
.* +
GetRequiredService+ =
<= >
ICustomerUoW> J
>J K
(K L
)L M
;M N
} 	
}
∆∆ 
}«« ÛL
oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Dowload\ImportExcelService.cs
	namespace

 	
Web


 
.

 
AppCore

 
.

 
Services

 
{ 
public 

class 
ImportExcelService #
:$ %
IImportExcelService& 9
{ 
private 
readonly 
ICustomerService )
_customerService* :
;: ;
public 
ImportExcelService !
(! "
ICustomerService" 2
customerService3 B
)B C
{ 	
_customerService 
= 
customerService .
;. /
} 	
public 
async 
Task 
< 
bool 
> $
ImportDataExcelToDBAsync  8
(8 9
ExcelRequest9 E
requestF M
)M N
{ 	
try 
{ 
if 
( 
request 
. 
FileData $
==% '
null( ,
||- /
request0 7
.7 8
FileData8 @
.@ A
LengthA G
<=H J
$numK L
)L M
returnN T
falseU Z
;Z [
var 
	customers 
= 
new  #
List$ (
<( )
Customer) 1
>1 2
(2 3
)3 4
;4 5
Stream 
stream 
= 
new  #
MemoryStream$ 0
(0 1
request1 8
.8 9
FileData9 A
)A B
;B C
var 
workbook 
= 
new "
Workbook# +
(+ ,
stream, 2
)2 3
;3 4
var 
ws 
= 
workbook !
.! "

Worksheets" ,
[, -
$num- .
]. /
;/ 0
for!! 
(!! 
int!! 
row!! 
=!! 
$num!!  
;!!  !
row!!" %
<!!& '
$num!!( ,
;!!, -
row!!. 1
++!!1 3
)!!3 4
{"" 
var## 
customer##  
=##! "
new### &
Customer##' /
(##/ 0
)##0 1
;##1 2
customer$$ 
.$$ 

CustomerId$$ '
=$$( )
$"$$* ,
{$$, -
Guid$$- 1
.$$1 2
NewGuid$$2 9
($$9 :
)$$: ;
}$$; <
"$$< =
;$$= >
customer%% 
.%% 
CustomerCode%% )
=%%* +
ws%%, .
.%%. /
Cells%%/ 4
[%%4 5
row%%5 8
,%%8 9
$num%%: ;
]%%; <
.%%< =
Value%%= B
.%%B C
ToString%%C K
(%%K L
)%%L M
;%%M N
customer&& 
.&& 
Gender&& #
=&&$ %
ws&&& (
.&&( )
Cells&&) .
[&&. /
row&&/ 2
,&&2 3
$num&&4 5
]&&5 6
.&&6 7
Value&&7 <
.&&< =
ToString&&= E
(&&E F
)&&F G
;&&G H
customer'' 
.'' 
SeniorCitizen'' *
=''+ ,
(''- .
int''. 1
)''1 2
ws''2 4
.''4 5
Cells''5 :
['': ;
row''; >
,''> ?
$num''@ A
]''A B
.''B C
Value''C H
;''H I
customer(( 
.(( 
Partner(( $
=((% &
ws((' )
.(() *
Cells((* /
[((/ 0
row((0 3
,((3 4
$num((5 6
]((6 7
.((7 8
Value((8 =
.((= >
ToString((> F
(((F G
)((G H
;((H I
customer)) 
.)) 

Dependents)) '
=))( )
ws))* ,
.)), -
Cells))- 2
[))2 3
row))3 6
,))6 7
$num))8 9
]))9 :
.)): ;
Value)); @
.))@ A
ToString))A I
())I J
)))J K
;))K L
customer** 
.** 
Tenure** #
=**$ %
(**& '
int**' *
)*** +
ws**+ -
.**- .
Cells**. 3
[**3 4
row**4 7
,**7 8
$num**9 :
]**: ;
.**; <
Value**< A
;**A B
customer++ 
.++ 
PhoneService++ )
=++* +
ws++, .
.++. /
Cells++/ 4
[++4 5
row++5 8
,++8 9
$num++: ;
]++; <
.++< =
Value++= B
.++B C
ToString++C K
(++K L
)++L M
;++M N
customer,, 
.,, 
MultipleLines,, *
=,,+ ,
ws,,- /
.,,/ 0
Cells,,0 5
[,,5 6
row,,6 9
,,,9 :
$num,,; <
],,< =
.,,= >
Value,,> C
.,,C D
ToString,,D L
(,,L M
),,M N
;,,N O
customer-- 
.-- 
InternetService-- ,
=--- .
ws--/ 1
.--1 2
Cells--2 7
[--7 8
row--8 ;
,--; <
$num--= >
]--> ?
.--? @
Value--@ E
.--E F
ToString--F N
(--N O
)--O P
;--P Q
customer.. 
... 
OnlineSecurity.. +
=.., -
ws... 0
...0 1
Cells..1 6
[..6 7
row..7 :
,..: ;
$num..< =
]..= >
...> ?
Value..? D
...D E
ToString..E M
(..M N
)..N O
;..O P
customer// 
.// 
OnlineBackup// )
=//* +
ws//, .
.//. /
Cells/// 4
[//4 5
row//5 8
,//8 9
$num//: <
]//< =
.//= >
Value//> C
.//C D
ToString//D L
(//L M
)//M N
;//N O
customer00 
.00 
DeviceProtection00 -
=00. /
ws000 2
.002 3
Cells003 8
[008 9
row009 <
,00< =
$num00> @
]00@ A
.00A B
Value00B G
.00G H
ToString00H P
(00P Q
)00Q R
;00R S
customer11 
.11 
TechSupport11 (
=11) *
ws11+ -
.11- .
Cells11. 3
[113 4
row114 7
,117 8
$num119 ;
]11; <
.11< =
Value11= B
.11B C
ToString11C K
(11K L
)11L M
;11M N
customer22 
.22 
StreamingTV22 (
=22) *
ws22+ -
.22- .
Cells22. 3
[223 4
row224 7
,227 8
$num229 ;
]22; <
.22< =
Value22= B
.22B C
ToString22C K
(22K L
)22L M
;22M N
customer33 
.33 
StreamingMovies33 ,
=33- .
ws33/ 1
.331 2
Cells332 7
[337 8
row338 ;
,33; <
$num33= ?
]33? @
.33@ A
Value33A F
.33F G
ToString33G O
(33O P
)33P Q
;33Q R
customer44 
.44 
Contract44 %
=44& '
ws44( *
.44* +
Cells44+ 0
[440 1
row441 4
,444 5
$num446 8
]448 9
.449 :
Value44: ?
.44? @
ToString44@ H
(44H I
)44I J
;44J K
customer55 
.55 
PaperlessBilling55 -
=55. /
ws550 2
.552 3
Cells553 8
[558 9
row559 <
,55< =
$num55> @
]55@ A
.55A B
Value55B G
.55G H
ToString55H P
(55P Q
)55Q R
;55R S
customer66 
.66 
PaymentMethod66 *
=66+ ,
ws66- /
.66/ 0
Cells660 5
[665 6
row666 9
,669 :
$num66; =
]66= >
.66> ?
Value66? D
.66D E
ToString66E M
(66M N
)66N O
;66O P
customer77 
.77 
MonthlyCharges77 +
=77, -
ws77. 0
.770 1
Cells771 6
[776 7
row777 :
,77: ;
$num77< >
]77> ?
.77? @
Value77@ E
.77E F
ToString77F N
(77N O
)77O P
;77P Q
customer88 
.88 
TotalCharges88 )
=88* +
ws88, .
.88. /
Cells88/ 4
[884 5
row885 8
,888 9
$num88: <
]88< =
.88= >
Value88> C
.88C D
ToString88D L
(88L M
)88M N
;88N O
customer99 
.99 
Churn99 "
=99# $
ws99% '
.99' (
Cells99( -
[99- .
row99. 1
,991 2
$num993 5
]995 6
.996 7
Value997 <
.99< =
ToString99= E
(99E F
)99F G
;99G H
	customers:: 
.:: 
Add:: !
(::! "
customer::" *
)::* +
;::+ ,
};; 
return== 
false== 
;== 
}>> 
catch?? 
(?? 
	Exception?? 
)?? 
{@@ 
returnAA 
falseAA 
;AA 
}BB 
}DD 	
}EE 
}FF ∫)
sC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\HttpClients\HttpClientResponse.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 
Services		 
{

 
public 

class 
HttpClientResponse #
{ 
private 
const 
string 
TAG  
=! "
$str# 7
;7 8
public 
bool 
IsSuccessStatusCode '
{( )
get* -
;- .
set/ 2
;2 3
}4 5
public 
string 
ReasonPhrase "
{# $
get% (
;( )
set* -
;- .
}/ 0
public 
HttpStatusCode 

StatusCode (
{) *
get+ .
;. /
set0 3
;3 4
}5 6
public 
bool 
Success 
=> 
	Exception (
==) +
null, 0
;0 1
public 
HttpResponseHeaders "
Headers# *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
public   
CookieCollection   
Cookies    '
{  ( )
get  * -
;  - .
set  / 2
;  2 3
}  4 5
public%% 
byte%% 
[%% 
]%% 

ByteResult%%  
{%%! "
get%%# &
;%%& '
set%%( +
;%%+ ,
}%%- .
public** 
string** 
ContentResult** #
=>**$ &
UTF8Encoding**' 3
.**3 4
UTF8**4 8
.**8 9
	GetString**9 B
(**B C

ByteResult**C M
)**M N
;**N O
public// 
	Exception// 
	Exception// "
{//# $
get//% (
;//( )
set//* -
;//- .
}/// 0
public55 
bool55 
IsNullOrEmpty55 !
(55! "
)55" #
=>55$ &

ByteResult55' 1
==552 4
null555 9
||55: <

ByteResult55= G
.55G H
Length55H N
<=55O Q
$num55R S
;55S T
public<< 
string<< 
	GetCookie<< 
(<<  
string<<  &
key<<' *
)<<* +
{== 	
try>> 
{?? 
return@@ 
Cookies@@ 
[@@ 
key@@ "
]@@" #
?@@# $
.@@$ %
Value@@% *
??@@+ -
string@@. 4
.@@4 5
Empty@@5 :
;@@: ;
}AA 
catchBB 
(BB 
	ExceptionBB 
exBB 
)BB  
{CC 
returnDD 
StringDD 
.DD 
EmptyDD #
;DD# $
}EE 
}FF 	
publicHH 
stringHH 
GetCookieTextHH #
(HH# $
)HH$ %
{II 	
varKK 
listKK 
=KK 
newKK 
ListKK 
<KK  
stringKK  &
>KK& '
(KK' (
)KK( )
;KK) *
tryMM 
{NN 
ifOO 
(OO 
CookiesOO 
!=OO 
nullOO #
&&OO$ &
CookiesOO' .
.OO. /
CountOO/ 4
>OO5 6
$numOO7 8
)OO8 9
{PP 
foreachRR 
(RR 
CookieRR #
cookieRR$ *
inRR+ -
CookiesRR. 5
)RR5 6
{SS 
listTT 
.TT 
AddTT  
(TT  !
$"TT! #
{TT# $
cookieTT$ *
.TT* +
NameTT+ /
}TT/ 0
$strTT0 1
{TT1 2
cookieTT2 8
.TT8 9
ValueTT9 >
}TT> ?
"TT? @
)TT@ A
;TTA B
}UU 
}VV 
}WW 
catchXX 
(XX 
	ExceptionXX 
exXX 
)XX  
{YY 
}[[ 
return]] 
string]] 
.]] 
Join]] 
(]] 
$str]] "
,]]" #
list]]$ (
)]]( )
;]]) *
}^^ 	
public`` 

Dictionary`` 
<`` 
string``  
,``  !
string``" (
>``( )
GetCookieHeaders``* :
(``: ;
)``; <
{aa 	
varbb 
resultbb 
=bb 
newbb 

Dictionarybb '
<bb' (
stringbb( .
,bb. /
stringbb0 6
>bb6 7
(bb7 8
)bb8 9
;bb9 :
varcc 

cookieTextcc 
=cc 
GetCookieTextcc *
(cc* +
)cc+ ,
;cc, -
ifdd 
(dd 
!dd 
stringdd 
.dd 
IsNullOrEmptydd %
(dd% &

cookieTextdd& 0
)dd0 1
)dd1 2
{ee 
resultff 
.ff 
Addff 
(ff 
$strff #
,ff# $

cookieTextff% /
)ff/ 0
;ff0 1
}gg 
returnhh 
resulthh 
;hh 
}ii 	
}jj 
}kk „¨
sC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\HttpClients\StandardHttpClient.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

static 
class 
StandardHttpClient *
{ 
private 
static 
readonly 
string  &
TAG' *
=+ ,
$str- A
;A B
private 
const 
int 
TIMEOUT !
=" #
$num$ '
;' (
private 
static 
HttpMessageHandler )!
GetHttpMessageHandler* ?
(? @
CookieContainer@ O
cookieContainerP _
)_ `
{ 	
var   
httpMessageHandler   "
=  # $
new  % (
HttpClientHandler  ) :
(  : ;
)  ; <
{!! 
AllowAutoRedirect"" !
=""" #
false""$ )
,"") *
CookieContainer## 
=##  !
cookieContainer##" 1
,##1 2"
AutomaticDecompression$$ &
=$$' ( 
DecompressionMethods$$) =
.$$= >
GZip$$> B
|$$C D 
DecompressionMethods$$E Y
.$$Y Z
Deflate$$Z a
}%% 
;%% 
httpMessageHandler&& 
.&& $
ClientCertificateOptions&& 7
=&&8 9#
ClientCertificateOption&&: Q
.&&Q R
Manual&&R X
;&&X Y
httpMessageHandler'' 
.'' 5
)ServerCertificateCustomValidationCallback'' H
+=''I K
(''L M
sender''M S
,''S T
certificate''U `
,''` a
chain''b g
,''g h
ssl''i l
)''l m
=>''n p
true''q u
;''u v
return(( 
httpMessageHandler(( %
;((% &
})) 	
private00 
static00 
void00 
SetHeaderHttpClient00 /
(00/ 0

HttpClient000 :

httpClient00; E
,00E F

Dictionary00G Q
<00Q R
string00R X
,00X Y
string00Z `
>00` a
headers00b i
)00i j
{11 	
try22 
{33 
if44 
(44 
headers44 
==44 
null44 #
||44$ &
headers44' .
.44. /
Count44/ 4
<=445 7
$num448 9
)449 :
return44; A
;44A B

httpClient55 
.55 !
DefaultRequestHeaders55 0
.550 1
Accept551 7
.557 8
Clear558 =
(55= >
)55> ?
;55? @
foreach66 
(66 
var66 
header66 #
in66$ &
headers66' .
)66. /
{660 1

httpClient662 <
.66< =!
DefaultRequestHeaders66= R
.66R S#
TryAddWithoutValidation66S j
(66j k
header66k q
.66q r
Key66r u
,66u v
header66w }
.66} ~
Value	66~ É
)
66É Ñ
;
66Ñ Ö
}
66Ü á
}77 
catch88 
(88 
	Exception88 
ex88 
)88  
{99 
throw:: 
ex:: 
;:: 
};; 
}<< 	
privateCC 
staticCC 
voidCC  
SetTimeoutHttpClientCC 0
(CC0 1

HttpClientCC1 ;

httpClientCC< F
,CCF G
intCCH K
timeoutCCL S
)CCS T
{DD 	
tryEE 
{FF 

httpClientGG 
.GG 
TimeoutGG "
=GG# $
TimeSpanGG% -
.GG- .
FromSecondsGG. 9
(GG9 :
timeoutGG: A
)GGA B
;GGB C
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
throwKK 
exKK 
;KK 
}LL 
}MM 	
privateTT 
staticTT 
asyncTT 
TaskTT !
<TT! "
stringTT" (
>TT( )#
GetQueryFromParamsAsyncTT* A
(TTA B

DictionaryTTB L
<TTL M
stringTTM S
,TTS T
stringTTU [
>TT[ \
paramQueriesTT] i
)TTi j
{UU 	
tryVV 
{WW 
ifXX 
(XX 
paramQueriesXX  
==XX! #
nullXX$ (
||XX) +
paramQueriesXX, 8
.XX8 9
CountXX9 >
<=XX? A
$numXXB C
)XXC D
returnXXE K
stringXXL R
.XXR S
EmptyXXS X
;XXX Y
usingYY 
varYY !
formUrlEncodedContentYY /
=YY0 1
newYY2 5!
FormUrlEncodedContentYY6 K
(YYK L
paramQueriesYYL X
)YYX Y
;YYY Z
returnZZ 
awaitZZ !
formUrlEncodedContentZZ 2
.ZZ2 3
ReadAsStringAsyncZZ3 D
(ZZD E
)ZZE F
;ZZF G
}[[ 
catch\\ 
(\\ 
	Exception\\ 
ex\\ 
)\\  
{]] 
throw^^ 
ex^^ 
;^^ 
}__ 
}`` 	
privatehh 
statichh 
asynchh 
Taskhh !
<hh! "
Urihh" %
>hh% &
GetUriAsynchh' 2
(hh2 3
stringhh3 9
urlhh: =
,hh= >

Dictionaryhh? I
<hhI J
stringhhJ P
,hhP Q
stringhhR X
>hhX Y
paramQuerieshhZ f
=hhg h
nullhhi m
)hhm n
{ii 	
varkk 
querieskk 
=kk 
awaitkk #
GetQueryFromParamsAsynckk  7
(kk7 8
paramQuerieskk8 D
)kkD E
;kkE F
returnmm 
newmm 
Urimm 
(mm 
$"mm 
{mm 
urlmm !
}mm! "
{mm" #
(mm# $
stringmm$ *
.mm* +
IsNullOrEmptymm+ 8
(mm8 9
queriesmm9 @
)mm@ A
?mmB C
stringmmD J
.mmJ K
EmptymmK P
:mmQ R
$"mmS U
$strmmU V
{mmV W
queriesmmW ^
}mm^ _
"mm_ `
)mm` a
}mma b
"mmb c
)mmc d
;mmd e
}nn 	
public{{ 
static{{ 
async{{ 
Task{{  
<{{  !
HttpClientResponse{{! 3
>{{3 4 
DoPostOrPutJsonAsync{{5 I
({{I J
string{{J P
url{{Q T
,{{T U

HttpMethod{{V `

httpMethod{{a k
,{{k l
object{{m s
data{{t x
,{{x y

Dictionary	{{z Ñ
<
{{Ñ Ö
string
{{Ö ã
,
{{ã å
string
{{ç ì
>
{{ì î
headers
{{ï ú
=
{{ù û
null
{{ü £
,
{{£ §

Dictionary
{{• Ø
<
{{Ø ∞
string
{{∞ ∂
,
{{∂ ∑
string
{{∏ æ
>
{{æ ø
paramQueries
{{¿ Ã
=
{{Õ Œ
null
{{œ ”
,
{{” ‘
int
{{’ ÿ
timeOut
{{Ÿ ‡
=
{{· ‚
TIMEOUT
{{„ Í
)
{{Í Î
{|| 	
return}} 
await}} 
DoPostOrPutAsync}} )
(}}) *
url}}* -
,}}- .

httpMethod}}/ 9
,}}9 :
new}}; >
StringContent}}? L
(}}L M
	JsonUtils}}M V
.}}V W
	Serialize}}W `
(}}` a
data}}a e
)}}e f
??}}g i
string}}j p
.}}p q
Empty}}q v
,}}v w
Encoding	}}x Ä
.
}}Ä Å
UTF8
}}Å Ö
,
}}Ö Ü
$str
}}á ô
)
}}ô ö
,
}}ö õ
headers
}}ú £
,
}}£ §
paramQueries
}}• ±
,
}}± ≤
timeOut
}}≥ ∫
)
}}∫ ª
;
}}ª º
}~~ 	
public
ââ 
static
ââ 
async
ââ 
Task
ââ  
<
ââ  ! 
HttpClientResponse
ââ! 3
>
ââ3 4%
DoPostOrPutEncodedAsync
ââ5 L
(
ââL M
string
ââM S
url
ââT W
,
ââW X

HttpMethod
ââY c

httpMethod
ââd n
,
âân o

Dictionary
ââp z
<
ââz {
stringââ{ Å
,ââÅ Ç
stringââÉ â
>âââ ä
dataââã è
,ââè ê

Dictionaryââë õ
<ââõ ú
stringââú ¢
,ââ¢ £
stringââ§ ™
>ââ™ ´
headersââ¨ ≥
=ââ¥ µ
nullââ∂ ∫
,ââ∫ ª

Dictionaryââº ∆
<ââ∆ «
stringââ« Õ
,ââÕ Œ
stringââœ ’
>ââ’ ÷
paramQueriesââ◊ „
=ââ‰ Â
nullââÊ Í
,ââÍ Î
intââÏ Ô
timeOutââ ˜
=ââ¯ ˘
TIMEOUTââ˙ Å
)ââÅ Ç
{
ää 	
return
ãã 
await
ãã 
DoPostOrPutAsync
ãã )
(
ãã) *
url
ãã* -
,
ãã- .

httpMethod
ãã/ 9
,
ãã9 :
new
ãã; >#
FormUrlEncodedContent
ãã? T
(
ããT U
data
ããU Y
)
ããY Z
,
ããZ [
headers
ãã\ c
,
ããc d
paramQueries
ããe q
,
ããq r
timeOut
ããs z
)
ããz {
;
ãã{ |
}
åå 	
public
óó 
static
óó 
async
óó 
Task
óó  
<
óó  ! 
HttpClientResponse
óó! 3
>
óó3 4
DoPostOrPutAsync
óó5 E
(
óóE F
string
óóF L
url
óóM P
,
óóP Q

HttpMethod
óóR \

httpMethod
óó] g
,
óóg h
HttpContent
óói t
httpContentóóu Ä
,óóÄ Å

DictionaryóóÇ å
<óóå ç
stringóóç ì
,óóì î
stringóóï õ
>óóõ ú
headersóóù §
=óó• ¶
nullóóß ´
,óó´ ¨

Dictionaryóó≠ ∑
<óó∑ ∏
stringóó∏ æ
,óóæ ø
stringóó¿ ∆
>óó∆ «
paramQueriesóó» ‘
=óó’ ÷
nullóó◊ €
,óó€ ‹
intóó› ‡
timeOutóó· Ë
=óóÈ Í
TIMEOUTóóÎ Ú
)óóÚ Û
{
òò 	
var
ôô 
result
ôô 
=
ôô 
new
ôô  
HttpClientResponse
ôô /
(
ôô/ 0
)
ôô0 1
;
ôô1 2
try
õõ 
{
úú 
var
ùù 
cookieContainer
ùù #
=
ùù$ %
new
ùù& )
CookieContainer
ùù* 9
(
ùù9 :
)
ùù: ;
;
ùù; <
using
ûû 
var
ûû 
client
ûû  
=
ûû! "
new
ûû# &

HttpClient
ûû' 1
(
ûû1 2#
GetHttpMessageHandler
ûû2 G
(
ûûG H
cookieContainer
ûûH W
)
ûûW X
)
ûûX Y
;
ûûY Z
var
°° 
uri
°° 
=
°° 
await
°° 
GetUriAsync
°°  +
(
°°+ ,
url
°°, /
,
°°/ 0
paramQueries
°°1 =
)
°°= >
;
°°> ?!
SetHeaderHttpClient
§§ #
(
§§# $
client
§§$ *
,
§§* +
headers
§§, 3
)
§§3 4
;
§§4 5"
SetTimeoutHttpClient
ßß $
(
ßß$ %
client
ßß% +
,
ßß+ ,
timeOut
ßß- 4
)
ßß4 5
;
ßß5 6
using
™™ 
var
™™ !
httpResponseMessage
™™ -
=
™™. /
await
™™0 5
client
™™6 <
.
™™< =
	SendAsync
™™= F
(
™™F G
new
™™G J 
HttpRequestMessage
™™K ]
{
™™^ _

RequestUri
™™` j
=
™™k l
uri
™™m p
,
™™p q
Method
™™r x
=
™™y z

httpMethod™™{ Ö
,™™Ö Ü
Content™™á é
=™™è ê
httpContent™™ë ú
}™™ù û
)™™û ü
;™™ü †
if
≠≠ 
(
≠≠ !
httpResponseMessage
≠≠ '
.
≠≠' (!
IsSuccessStatusCode
≠≠( ;
)
≠≠; <
{
ÆÆ 
result
ØØ 
.
ØØ 

ByteResult
ØØ %
=
ØØ& '
await
ØØ( -!
httpResponseMessage
ØØ. A
.
ØØA B
Content
ØØB I
.
ØØI J"
ReadAsByteArrayAsync
ØØJ ^
(
ØØ^ _
)
ØØ_ `
;
ØØ` a
}
∞∞ 
else
±± 
{
≤≤ 
}
¥¥ 
result
∏∏ 
.
∏∏ !
IsSuccessStatusCode
∏∏ *
=
∏∏+ ,!
httpResponseMessage
∏∏- @
.
∏∏@ A!
IsSuccessStatusCode
∏∏A T
;
∏∏T U
result
ππ 
.
ππ 

StatusCode
ππ !
=
ππ" #!
httpResponseMessage
ππ$ 7
.
ππ7 8

StatusCode
ππ8 B
;
ππB C
result
∫∫ 
.
∫∫ 
ReasonPhrase
∫∫ #
=
∫∫$ %!
httpResponseMessage
∫∫& 9
.
∫∫9 :
ReasonPhrase
∫∫: F
;
∫∫F G
result
ªª 
.
ªª 
Cookies
ªª 
=
ªª  
cookieContainer
ªª! 0
.
ªª0 1

GetCookies
ªª1 ;
(
ªª; <
uri
ªª< ?
)
ªª? @
;
ªª@ A
result
ºº 
.
ºº 
Headers
ºº 
=
ºº  !
httpResponseMessage
ºº! 4
.
ºº4 5
Headers
ºº5 <
;
ºº< =
}
ΩΩ 
catch
ææ 
(
ææ 
	Exception
ææ 
ex
ææ 
)
ææ  
{
øø 
result
¿¿ 
.
¿¿ 
	Exception
¿¿  
=
¿¿! "
ex
¿¿# %
;
¿¿% &
}
¡¡ 
return
√√ 
result
√√ 
;
√√ 
}
ƒƒ 	
public
ŒŒ 
static
ŒŒ 
async
ŒŒ 
Task
ŒŒ  
<
ŒŒ  ! 
HttpClientResponse
ŒŒ! 3
>
ŒŒ3 4
GetAsync
ŒŒ5 =
(
ŒŒ= >
string
ŒŒ> D
url
ŒŒE H
,
ŒŒH I

Dictionary
ŒŒJ T
<
ŒŒT U
string
ŒŒU [
,
ŒŒ[ \
string
ŒŒ] c
>
ŒŒc d
paramQueries
ŒŒe q
=
ŒŒr s
null
ŒŒt x
,
ŒŒx y

DictionaryŒŒz Ñ
<ŒŒÑ Ö
stringŒŒÖ ã
,ŒŒã å
stringŒŒç ì
>ŒŒì î
headersŒŒï ú
=ŒŒù û
nullŒŒü £
,ŒŒ£ §
intŒŒ• ®
timeOutŒŒ© ∞
=ŒŒ± ≤
TIMEOUTŒŒ≥ ∫
)ŒŒ∫ ª
{
œœ 	
var
–– 
result
–– 
=
–– 
new
––  
HttpClientResponse
–– /
(
––/ 0
)
––0 1
;
––1 2
try
““ 
{
”” 
var
‘‘ 
cookieContainer
‘‘ #
=
‘‘$ %
new
‘‘& )
CookieContainer
‘‘* 9
(
‘‘9 :
)
‘‘: ;
;
‘‘; <
using
’’ 
var
’’ 
client
’’  
=
’’! "
new
’’# &

HttpClient
’’' 1
(
’’1 2#
GetHttpMessageHandler
’’2 G
(
’’G H
cookieContainer
’’H W
)
’’W X
)
’’X Y
;
’’Y Z
var
ÿÿ 
uri
ÿÿ 
=
ÿÿ 
await
ÿÿ 
GetUriAsync
ÿÿ  +
(
ÿÿ+ ,
url
ÿÿ, /
,
ÿÿ/ 0
paramQueries
ÿÿ1 =
)
ÿÿ= >
;
ÿÿ> ?!
SetHeaderHttpClient
€€ #
(
€€# $
client
€€$ *
,
€€* +
headers
€€, 3
)
€€3 4
;
€€4 5"
SetTimeoutHttpClient
ﬁﬁ $
(
ﬁﬁ$ %
client
ﬁﬁ% +
,
ﬁﬁ+ ,
timeOut
ﬁﬁ- 4
)
ﬁﬁ4 5
;
ﬁﬁ5 6
using
·· 
var
·· !
httpResponseMessage
·· -
=
··. /
await
··0 5
client
··6 <
.
··< =
GetAsync
··= E
(
··E F
uri
··F I
)
··I J
;
··J K
if
‰‰ 
(
‰‰ !
httpResponseMessage
‰‰ '
.
‰‰' (!
IsSuccessStatusCode
‰‰( ;
)
‰‰; <
{
ÂÂ 
result
ÊÊ 
.
ÊÊ 

ByteResult
ÊÊ %
=
ÊÊ& '
await
ÊÊ( -!
httpResponseMessage
ÊÊ. A
.
ÊÊA B
Content
ÊÊB I
.
ÊÊI J"
ReadAsByteArrayAsync
ÊÊJ ^
(
ÊÊ^ _
)
ÊÊ_ `
;
ÊÊ` a
}
ÁÁ 
else
ËË 
{
ÈÈ 
}
ÍÍ 
result
ÌÌ 
.
ÌÌ !
IsSuccessStatusCode
ÌÌ *
=
ÌÌ+ ,!
httpResponseMessage
ÌÌ- @
.
ÌÌ@ A!
IsSuccessStatusCode
ÌÌA T
;
ÌÌT U
result
ÓÓ 
.
ÓÓ 

StatusCode
ÓÓ !
=
ÓÓ" #!
httpResponseMessage
ÓÓ$ 7
.
ÓÓ7 8

StatusCode
ÓÓ8 B
;
ÓÓB C
result
ÔÔ 
.
ÔÔ 
ReasonPhrase
ÔÔ #
=
ÔÔ$ %!
httpResponseMessage
ÔÔ& 9
.
ÔÔ9 :
ReasonPhrase
ÔÔ: F
;
ÔÔF G
result
 
.
 
Cookies
 
=
  
cookieContainer
! 0
.
0 1

GetCookies
1 ;
(
; <
uri
< ?
)
? @
;
@ A
result
ÒÒ 
.
ÒÒ 
Headers
ÒÒ 
=
ÒÒ  !
httpResponseMessage
ÒÒ! 4
.
ÒÒ4 5
Headers
ÒÒ5 <
;
ÒÒ< =
}
ÚÚ 
catch
ÛÛ 
(
ÛÛ 
	Exception
ÛÛ 
ex
ÛÛ 
)
ÛÛ  
{
ÙÙ 
result
ıı 
.
ıı 
	Exception
ıı  
=
ıı! "
ex
ıı# %
;
ıı% &
}
ˆˆ 
return
¯¯ 
result
¯¯ 
;
¯¯ 
}
˘˘ 	
public
ÉÉ 
static
ÉÉ 
async
ÉÉ 
Task
ÉÉ  
<
ÉÉ  ! 
HttpClientResponse
ÉÉ! 3
>
ÉÉ3 4
DeleteAsync
ÉÉ5 @
(
ÉÉ@ A
string
ÉÉA G
url
ÉÉH K
,
ÉÉK L

Dictionary
ÉÉM W
<
ÉÉW X
string
ÉÉX ^
,
ÉÉ^ _
string
ÉÉ` f
>
ÉÉf g
paramDeletes
ÉÉh t
=
ÉÉu v
null
ÉÉw {
,
ÉÉ{ |

DictionaryÉÉ} á
<ÉÉá à
stringÉÉà é
,ÉÉé è
stringÉÉê ñ
>ÉÉñ ó
headersÉÉò ü
=ÉÉ† °
nullÉÉ¢ ¶
,ÉÉ¶ ß
intÉÉ® ´
timeOutÉÉ¨ ≥
=ÉÉ¥ µ
TIMEOUTÉÉ∂ Ω
)ÉÉΩ æ
{
ÑÑ 	
var
ÖÖ 
result
ÖÖ 
=
ÖÖ 
new
ÖÖ  
HttpClientResponse
ÖÖ /
(
ÖÖ/ 0
)
ÖÖ0 1
;
ÖÖ1 2
try
áá 
{
àà 
var
ââ 
cookieContainer
ââ #
=
ââ$ %
new
ââ& )
CookieContainer
ââ* 9
(
ââ9 :
)
ââ: ;
;
ââ; <
using
ää 
var
ää 
client
ää  
=
ää! "
new
ää# &

HttpClient
ää' 1
(
ää1 2#
GetHttpMessageHandler
ää2 G
(
ääG H
cookieContainer
ääH W
)
ääW X
)
ääX Y
;
ääY Z
var
çç 
uri
çç 
=
çç 
await
çç 
GetUriAsync
çç  +
(
çç+ ,
url
çç, /
,
çç/ 0
paramDeletes
çç1 =
)
çç= >
;
çç> ?!
SetHeaderHttpClient
êê #
(
êê# $
client
êê$ *
,
êê* +
headers
êê, 3
)
êê3 4
;
êê4 5"
SetTimeoutHttpClient
ìì $
(
ìì$ %
client
ìì% +
,
ìì+ ,
timeOut
ìì- 4
)
ìì4 5
;
ìì5 6
using
ññ 
var
ññ !
httpResponseMessage
ññ -
=
ññ. /
await
ññ0 5
client
ññ6 <
.
ññ< =
DeleteAsync
ññ= H
(
ññH I
uri
ññI L
)
ññL M
;
ññM N
if
ôô 
(
ôô !
httpResponseMessage
ôô '
.
ôô' (!
IsSuccessStatusCode
ôô( ;
)
ôô; <
{
öö 
result
õõ 
.
õõ 

ByteResult
õõ %
=
õõ& '
await
õõ( -!
httpResponseMessage
õõ. A
.
õõA B
Content
õõB I
.
õõI J"
ReadAsByteArrayAsync
õõJ ^
(
õõ^ _
)
õõ_ `
;
õõ` a
}
úú 
else
ùù 
{
ûû 
}
üü 
result
££ 
.
££ !
IsSuccessStatusCode
££ *
=
££+ ,!
httpResponseMessage
££- @
.
££@ A!
IsSuccessStatusCode
££A T
;
££T U
result
§§ 
.
§§ 

StatusCode
§§ !
=
§§" #!
httpResponseMessage
§§$ 7
.
§§7 8

StatusCode
§§8 B
;
§§B C
result
•• 
.
•• 
ReasonPhrase
•• #
=
••$ %!
httpResponseMessage
••& 9
.
••9 :
ReasonPhrase
••: F
;
••F G
result
¶¶ 
.
¶¶ 
Cookies
¶¶ 
=
¶¶  
cookieContainer
¶¶! 0
.
¶¶0 1

GetCookies
¶¶1 ;
(
¶¶; <
uri
¶¶< ?
)
¶¶? @
;
¶¶@ A
result
ßß 
.
ßß 
Headers
ßß 
=
ßß  !
httpResponseMessage
ßß! 4
.
ßß4 5
Headers
ßß5 <
;
ßß< =
}
®® 
catch
©© 
(
©© 
	Exception
©© 
ex
©© 
)
©©  
{
™™ 
result
´´ 
.
´´ 
	Exception
´´  
=
´´! "
ex
´´# %
;
´´% &
}
¨¨ 
return
ÆÆ 
result
ÆÆ 
;
ÆÆ 
}
ØØ 	
}
±± 
}≤≤ ﬂ$
oC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\MessageQueue\ConsumerQueue.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
. 
MessageQueue +
{ 
public 

class 
ConsumerQueue 
:  
IConsumerQueue! /
{ 
private 
const 
string 
_queueNameOrder ,
=- .
$str/ C
;C D
private 
MessageQ 
. 
QueueSettings &
_queueSettings' 5
;5 6
private 
	IConsumer 
< 
Order 
>  
_orderConsumer! /
;/ 0
private 
	IConsumer 
< 
OrderRequest &
>& '
_orderConsumerR( 7
;7 8
private 
QueueNameSettings !

_queueName" ,
;, -
private 
	IConsumer 
< 
Order 
>  
OrderConsumer! .
=>/ 1
_orderConsumer2 @
??=A D
newE H
ConsumerI Q
<Q R
OrderR W
>W X
(X Y
_queueSettingsY g
)g h
;h i
private 
	IConsumer 
< 
OrderRequest &
>& '
OrderInsertConsumer( ;
=>< >
_orderConsumerR? N
??=O R
newS V
ConsumerW _
<_ `
OrderRequest` l
>l m
(m n
_queueSettingsn |
)| }
;} ~
public   
ConsumerQueue   
(   
IOptions   %
<  % &
MessageQ  & .
.  . /
QueueSettings  / <
>  < =
optionsSettings  > M
,  M N
IOptions  O W
<  W X
QueueNameSettings  X i
>  i j
optionsName  k v
)  v w
{!! 	
_queueSettings"" 
="" 
optionsSettings"" ,
."", -
Value""- 2
;""2 3

_queueName## 
=## 
optionsName## $
.##$ %
Value##% *
;##* +
}$$ 	
public++ 
async++ 
Task++ 
<++ 
bool++ 
>++ #
PublishUpdateOrderAsync++  7
(++7 8
object++8 >
data++? C
,++C D
IDictionary++E P
<++P Q
string++Q W
,++W X
object++Y _
>++_ `
headers++a h
=++i j
null++k o
)++o p
{,, 	
await-- 
Task-- 
.-- 
CompletedTask-- $
;--$ %
return.. 
false.. 
;.. 
}// 	
private11 
async11 
Task11 
<11 
bool11 
>11  
CheckDataQueue11! /
(11/ 0
)110 1
{22 	
await33 
Task33 
.33 
CompletedTask33 $
;33$ %
return44 
true44 
;44 
}55 	
public77 
async77 
Task77 
StartConsumeAsync77 +
(77+ ,
Func77, 0
<770 1
Order771 6
,776 7
IDictionary778 C
<77C D
string77D J
,77J K
object77L R
>77R S
,77S T
Task77U Y
<77Y Z
bool77Z ^
>77^ _
>77_ `
onMessageHandle77a p
)77p q
{88 	
await99 
OrderConsumer99 
.99  
StartConsumeAsync99  1
(991 2

_queueName992 <
.99< =
QueueNameOrder99= K
,99K L
onMessageHandle99M \
)99\ ]
;99] ^
}:: 	
public<< 
async<< 
Task<< 
StartConsumeAsync<< +
(<<+ ,
Func<<, 0
<<<0 1
OrderRequest<<1 =
,<<= >
IDictionary<<? J
<<<J K
string<<K Q
,<<Q R
object<<S Y
><<Y Z
,<<Z [
Task<<\ `
<<<` a
bool<<a e
><<e f
><<f g
onMessageHandle<<h w
)<<w x
{== 	
await>> 
OrderInsertConsumer>> %
.>>% &
StartConsumeAsync>>& 7
(>>7 8

_queueName>>8 B
.>>B C 
QueueNameInsertOrder>>C W
,>>W X
onMessageHandle>>Y h
)>>h i
;>>i j
}?? 	
}AA 
}BB ≥
pC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\MessageQueue\PublisherQueue.cs
	namespace		 	
Web		
 
.		 
AppCore		 
.		 
Services		 
.		 
MessageQueue		 +
{

 
public 

class 
PublisherQueue 
:  !
IPublisherQueue" 1
{ 
private 
const 
string 
_queueNameOrder ,
=- .
$str/ C
;C D
private 
readonly 

IPublisher #

_publisher$ .
;. /
private 
readonly 
QueueNameSettings *
_queueNameSettings+ =
;= >
public 
PublisherQueue 
( 

IPublisher (
	publisher) 2
)2 3
{ 	

_publisher 
= 
	publisher "
;" #
_queueNameSettings 
=  
new! $
QueueNameSettings% 6
(6 7
)7 8
;8 9
} 	
public'' 
async'' 
Task'' 
<'' 
bool'' 
>'' #
PublishUpdateOrderAsync''  7
(''7 8
object''8 >
data''? C
,''C D
IDictionary''E P
<''P Q
string''Q W
,''W X
object''Y _
>''_ `
headers''a h
=''i j
null''k o
)''o p
{(( 	
await)) 
Task)) 
.)) 
CompletedTask)) $
;))$ %
return** 

_publisher** 
.** 
Publish** %
(**% &
_queueNameSettings**& 8
.**8 9
QueueNameOrder**9 G
,**G H
data**I M
,**M N
headers**O V
)**V W
;**W X
}++ 	
public33 
async33 
Task33 
<33 
bool33 
>33 #
PublishInsertOrderAsync33  7
(337 8
object338 >
data33? C
,33C D
IDictionary33E P
<33P Q
string33Q W
,33W X
object33Y _
>33_ `
headers33a h
=33i j
null33k o
)33o p
{44 	
await55 
Task55 
.55 
CompletedTask55 $
;55$ %
return66 

_publisher66 
.66 
Publish66 %
(66% &
_queueNameSettings66& 8
.668 9 
QueueNameInsertOrder669 M
,66M N
data66O S
,66S T
headers66U \
)66\ ]
;66] ^
}77 	
}99 
}:: µ
sC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\MessageQueue\QueueNameSettings.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
. 
MessageQueue +
{ 
public		 

class		 
QueueNameSettings		 "
{

 
public 
string 
QueueNameOrder $
{% &
get' *
;* +
set, /
;/ 0
}1 2
=3 4
$str5 I
;I J
public 
string  
QueueNameInsertOrder *
{+ ,
get- 0
;0 1
set2 5
;5 6
}7 8
=9 :
$str; U
;U V
} 
} È
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Order\CartService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 
CartService

 
:

 
BaseDomainService

 0
<

0 1
CartService

1 <
>

< =
,

= >
ICartService

? K
{ 
public 
CartService 
( 
IServiceProvider +
serviceProvider, ;
); <
:= >
base? C
(C D
serviceProviderD S
)S T
{ 	
} 	
private 
string 
KeyCachedCart $
($ %
string% +
userId, 2
)2 3
=>4 6
$"7 9
$str9 >
{> ?
userId? E
}E F
"F G
;G H
} 
} ˆ
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Order\OrderItemService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
OrderItemService !
:" #
BaseDomainService$ 5
<5 6
OrderItemService6 F
>F G
,G H
IOrderItemServiceI Z
{ 
public 
OrderItemService 
(  
IServiceProvider  0
serviceProvider1 @
)@ A
:B C
baseD H
(H I
serviceProviderI X
)X Y
{ 	
} 	
} 
} ØP
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Order\OrderService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
OrderService 
: 
BaseDomainService  1
<1 2
OrderService2 >
>> ?
,? @
IOrderServiceA N
{ 
private 
readonly 
IPublisherQueue (
_publisherQueue) 8
;8 9
private 
readonly 
	IOrderUoW "
	_orderUoW# ,
;, -
private 
readonly 
IOrderItemUoW &
_orderItemUoW' 4
;4 5
public 
OrderService 
( 
IPublisherQueue +
publisherQueue, :
,: ;
IServiceProvider< L
serviceProviderM \
)\ ]
:^ _
base` d
(d e
serviceProvidere t
)t u
{ 	
_publisherQueue 
= 
publisherQueue ,
;, -
	_orderUoW 
= 
serviceProvider '
.' (
GetRequiredService( :
<: ;
	IOrderUoW; D
>D E
(E F
)F G
;G H
_orderItemUoW 
= 
serviceProvider +
.+ ,
GetRequiredService, >
<> ?
IOrderItemUoW? L
>L M
(M N
)N O
;O P
} 	
public## 
async## 
Task## 
<## 
bool## 
>## 
DeleteOrderAsync##  0
(##0 1
string##1 7
orderId##8 ?
)##? @
{$$ 	
try%% 
{&& 
if'' 
('' 
string'' 
.'' 
IsNullOrEmpty'' (
(''( )
orderId'') 0
)''0 1
)''1 2
return''3 9
false'': ?
;''? @
var)) 

orderItems)) 
=))  
await))! &
_orderItemUoW))' 4
.))4 5

OrderItems))5 ?
.))? @
GetAllAsync))@ K
())K L
x))L M
=>))N P
x))Q R
.))R S
order_id))S [
==))\ ^
orderId))_ f
)))f g
;))g h
await** 
_orderItemUoW** #
.**# $

OrderItems**$ .
.**. /
DeleteManyAsync**/ >
(**> ?

orderItems**? I
)**I J
;**J K
var,, 
	resDelete,, 
=,, 
await,,  %
	_orderUoW,,& /
.,,/ 0
Orders,,0 6
.,,6 7
DeleteOneAsync,,7 E
(,,E F
orderId,,F M
),,M N
;,,N O
return-- 
	resDelete--  
;--  !
}.. 
catch// 
(// 
	Exception// 
ex// 
)//  
{00 
return11 
false11 
;11 
}22 
}33 	
public:: 
async:: 
Task:: 
<:: 
bool:: 
>:: 
DeleteOrdersAsync::  1
(::1 2
IEnumerable::2 =
<::= >
string::> D
>::D E
orderIds::F N
)::N O
{;; 	
try<< 
{== 
if>> 
(>> 
orderIds>> 
==>> 
null>>  $
&&>>% '
orderIds>>( 0
.>>0 1
Count>>1 6
(>>6 7
)>>7 8
<=>>9 ;
$num>>< =
)>>= >
return>>? E
false>>F K
;>>K L
varAA 

orderItemsAA 
=AA  
awaitAA! &
_orderItemUoWAA' 4
.AA4 5

OrderItemsAA5 ?
.AA? @
GetAllAsyncAA@ K
(AAK L
xAAL M
=>AAN P
orderIdsAAQ Y
.AAY Z
AnyAAZ ]
(AA] ^
oAA^ _
=>AA` b
oAAc d
==AAe g
xAAh i
.AAi j
order_idAAj r
)AAr s
)AAs t
;AAt u
awaitBB 
_orderItemUoWBB #
.BB# $

OrderItemsBB$ .
.BB. /
DeleteManyAsyncBB/ >
(BB> ?

orderItemsBB? I
)BBI J
;BBJ K
varDD 
	resDeleteDD 
=DD 
awaitDD  %
	_orderUoWDD& /
.DD/ 0
OrdersDD0 6
.DD6 7
DeleteManyAsyncDD7 F
(DDF G
orderIdsDDG O
)DDO P
;DDP Q
returnEE 
	resDeleteEE  
;EE  !
}FF 
catchGG 
(GG 
	ExceptionGG 
exGG 
)GG  
{HH 
returnII 
falseII 
;II 
}JJ 
}KK 	
publicMM 
asyncMM 
TaskMM 
<MM 
OrderMM 
>MM  
GetOrderAsyncMM! .
(MM. /
stringMM/ 5
orderIdMM6 =
)MM= >
{NN 	
returnOO 
awaitOO 
	_orderUoWOO "
.OO" #
OrdersOO# )
.OO) *
GetByIdAsyncOO* 6
(OO6 7
orderIdOO7 >
)OO> ?
;OO? @
}PP 	
publicRR 
asyncRR 
TaskRR 
<RR 
PaggingRR !
<RR! "
OrderRR" '
>RR' (
>RR( )
GetOrderPageAsyncRR* ;
(RR; <

PaginationRR< F

paginationRRG Q
,RRQ R
FuncRRS W
<RRW X
OrderRRX ]
,RR] ^
boolRR_ c
>RRc d
	predicateRRe n
)RRn o
{SS 	
returnTT 
awaitTT 
	_orderUoWTT "
.TT" #
OrdersTT# )
.TT) *
GetPaggingAsyncTT* 9
(TT9 :

paginationTT: D
,TTD E
	predicateTTF O
)TTO P
;TTP Q
}UU 	
public\\ 
async\\ 
Task\\ 
<\\ 
bool\\ 
>\\ 
InsertOrderAsync\\  0
(\\0 1
OrderRequest\\1 =
orderRequest\\> J
)\\J K
{]] 	
try^^ 
{__ 
var`` 
orderInsert`` 
=``  !
await``" '
	_orderUoW``( 1
.``1 2
Orders``2 8
.``8 9
InsertOneAsync``9 G
(``G H
orderRequest``H T
)``T U
;``U V
ifaa 
(aa 
orderInsertaa 
==aa  "
nullaa# '
)aa' (
returnaa) /
falseaa0 5
;aa5 6
ifdd 
(dd 
orderRequestdd  
.dd  !
order_itemsdd! ,
!=dd- /
nulldd0 4
&&dd5 7
orderRequestdd8 D
.ddD E
order_itemsddE P
.ddP Q
CountddQ V
>ddW X
$numddY Z
)ddZ [
{ee 
foreachff 
(ff 
varff  
	orderItemff! *
inff+ -
orderRequestff. :
.ff: ;
order_itemsff; F
)ffF G
{gg 
	orderItemhh !
.hh! "
order_idhh" *
=hh+ ,
orderRequesthh- 9
.hh9 :
idhh: <
;hh< =
}ii 
awaitjj 
_orderItemUoWjj '
.jj' (

OrderItemsjj( 2
.jj2 3
InsertManyAsyncjj3 B
(jjB C
orderRequestjjC O
.jjO P
order_itemsjjP [
)jj[ \
;jj\ ]
}kk 
returnll 
truell 
;ll 
}mm 
catchnn 
(nn 
	Exceptionnn 
exnn 
)nn  
{oo 
returnpp 
falsepp 
;pp 
}qq 
}rr 	
publictt 
asynctt 
Tasktt 
<tt 
booltt 
>tt #
InsertOrderOnQueueAsynctt  7
(tt7 8
OrderRequesttt8 D
orderttE J
,ttJ K
IDictionaryttL W
<ttW X
stringttX ^
,tt^ _
objecttt` f
>ttf g
headerstth o
)tto p
{uu 	
returnvv 
awaitvv 
InsertOrderAsyncvv )
(vv) *
ordervv* /
)vv/ 0
;vv0 1
}ww 	
public~~ 
async~~ 
Task~~ 
<~~ 
bool~~ 
>~~ 
UpdateOrderAsync~~  0
(~~0 1
Order~~1 6
order~~7 <
)~~< =
{ 	
return
ÄÄ 
await
ÄÄ 
	_orderUoW
ÄÄ "
.
ÄÄ" #
Orders
ÄÄ# )
.
ÄÄ) *
UpdateOneAsync
ÄÄ* 8
(
ÄÄ8 9
order
ÄÄ9 >
)
ÄÄ> ?
;
ÄÄ? @
}
ÅÅ 	
public
ÉÉ 
async
ÉÉ 
Task
ÉÉ 
<
ÉÉ 
bool
ÉÉ 
>
ÉÉ 
UpdateOrderAsync
ÉÉ  0
(
ÉÉ0 1
)
ÉÉ1 2
{
ÑÑ 	
return
ÖÖ 
await
ÖÖ 
_publisherQueue
ÖÖ (
.
ÖÖ( )%
PublishUpdateOrderAsync
ÖÖ) @
(
ÖÖ@ A
$str
ÖÖA N
)
ÖÖN O
;
ÖÖO P
}
ÜÜ 	
public
åå 
Task
åå 
<
åå 
bool
åå 
>
åå %
UpdatePaymentOrderAsync
åå 1
(
åå1 2
)
åå2 3
{
çç 	
throw
éé 
new
éé %
NotImplementedException
éé -
(
éé- .
)
éé. /
;
éé/ 0
}
èè 	
public
ëë 
async
ëë 
Task
ëë 
<
ëë 
bool
ëë 
>
ëë %
UpdateOrderOnQueueAsync
ëë  7
(
ëë7 8
Order
ëë8 =
order
ëë> C
,
ëëC D
IDictionary
ëëE P
<
ëëP Q
string
ëëQ W
,
ëëW X
object
ëëY _
>
ëë_ `
headers
ëëa h
)
ëëh i
{
íí 	
return
ìì 
await
ìì 
	_orderUoW
ìì "
.
ìì" #
Orders
ìì# )
.
ìì) *
UpdateOneAsync
ìì* 8
(
ìì8 9
order
ìì9 >
)
ìì> ?
;
ìì? @
}
îî 	
}
ïï 
}ññ ‰Ë
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Product\ProductService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
ProductService 
:  !
BaseDomainService" 3
<3 4
ProductService4 B
>B C
,C D
IProductServiceE T
{ 
private 
const 
string 
TAG  
=! "
$str# 3
;3 4
private 
readonly 
IProductUoW $
_productUoW% 0
;0 1
private 
readonly 
IProductCategoryUoW ,
_productCategoryUoW- @
;@ A
private 
readonly 
ISizeUoW !
_sizeUoW" *
;* +
private 
readonly 
	IColorUoW "
	_colorUoW# ,
;, -
private 
readonly 
IOrderItemUoW &
_orderItemUoW' 4
;4 5
private 
readonly 
	IImageUoW "
	_imageUoW# ,
;, -
private 
readonly 
IStorageClient '
_storageClient( 6
;6 7
public!! 
ProductService!! 
(!! 
IServiceProvider!! .
serviceProvider!!/ >
)!!> ?
:!!@ A
base!!B F
(!!F G
serviceProvider!!G V
)!!V W
{"" 	
_productUoW## 
=## 
serviceProvider## )
.##) *
GetRequiredService##* <
<##< =
IProductUoW##= H
>##H I
(##I J
)##J K
;##K L
_productCategoryUoW$$ 
=$$  !
serviceProvider$$" 1
.$$1 2
GetRequiredService$$2 D
<$$D E
IProductCategoryUoW$$E X
>$$X Y
($$Y Z
)$$Z [
;$$[ \
_sizeUoW%% 
=%% 
serviceProvider%% &
.%%& '
GetRequiredService%%' 9
<%%9 :
ISizeUoW%%: B
>%%B C
(%%C D
)%%D E
;%%E F
	_colorUoW&& 
=&& 
serviceProvider&& '
.&&' (
GetRequiredService&&( :
<&&: ;
	IColorUoW&&; D
>&&D E
(&&E F
)&&F G
;&&G H
_orderItemUoW'' 
='' 
serviceProvider'' +
.''+ ,
GetRequiredService'', >
<''> ?
IOrderItemUoW''? L
>''L M
(''M N
)''N O
;''O P
	_imageUoW(( 
=(( 
serviceProvider(( '
.((' (
GetRequiredService((( :
<((: ;
	IImageUoW((; D
>((D E
(((E F
)((F G
;((G H
_storageClient)) 
=)) 
serviceProvider)) ,
.)), -
GetRequiredService))- ?
<))? @
IStorageClient))@ N
>))N O
())O P
)))P Q
;))Q R
}** 	
public66 
async66 
Task66 
<66 
DeleteStatus66 &
>66& '&
DeleteProductCategoryAsync66( B
(66B C"
ProductCategoryRequest66C Y
request66Z a
)66a b
{77 	
try88 
{99 
if;; 
(;; 
request;; 
.;; 
products;; $
==;;% '
null;;( ,
||;;- /
request;;0 7
.;;7 8
products;;8 @
.;;@ A
Count;;A F
(;;F G
);;G H
<=;;I K
$num;;L M
);;M N
{<< 
request== 
.== 
products== $
===% &
await==' ,
_productUoW==- 8
.==8 9
Products==9 A
.==A B
GetAllAsync==B M
(==M N
x==N O
=>==P R
x==S T
.==T U
product_category_id==U h
====i k
request==l s
.==s t
id==t v
)==v w
;==w x
}>> 
if@@ 
(@@ 
request@@ 
.@@ 
products@@ $
!=@@% '
null@@( ,
&&@@- /
request@@0 7
.@@7 8
products@@8 @
.@@@ A
Count@@A F
(@@F G
)@@G H
>@@I J
$num@@K L
)@@L M
{AA 
varBB 
productsBB  
=BB! "
awaitBB# (
_productUoWBB) 4
.BB4 5
ProductsBB5 =
.BB= >
GetAllAsyncBB> I
(BBI J
xBBJ K
=>BBL N
xBBO P
.BBP Q
product_category_idBBQ d
==BBe g
requestBBh o
.BBo p
idBBp r
)BBr s
;BBs t
varCC 
deleteStatusCC $
=CC% &
awaitCC' ,
DeleteProductsAsyncCC- @
(CC@ A
requestCCA H
.CCH I
productsCCI Q
)CCQ R
;CCR S
ifFF 
(FF 
deleteStatusFF $
!=FF% '
DeleteStatusFF( 4
.FF4 5
SuccessFF5 <
)FF< =
returnFF> D
deleteStatusFFE Q
;FFQ R
}GG 
varJJ 
	resDeleteJJ 
=JJ 
awaitJJ  %
_productCategoryUoWJJ& 9
.JJ9 :
ProductCategoriesJJ: K
.JJK L
DeleteOneAsyncJJL Z
(JJZ [
requestJJ[ b
)JJb c
;JJc d
returnKK 
	resDeleteKK  
?KK! "
DeleteStatusKK# /
.KK/ 0
SuccessKK0 7
:KK8 9
DeleteStatusKK: F
.KKF G
FailKKG K
;KKK L
}LL 
catchMM 
(MM 
	ExceptionMM 
exMM 
)MM  
{NN 
returnOO 
DeleteStatusOO #
.OO# $
FailOO$ (
;OO( )
}PP 
}QQ 	
publicWW 
asyncWW 
TaskWW 
<WW 
IEnumerableWW %
<WW% &
ProductCategoryWW& 5
>WW5 6
>WW6 7%
GetProductCategoriesAsyncWW8 Q
(WWQ R
)WWR S
{XX 	
returnYY 
awaitYY 
_productCategoryUoWYY ,
.YY, -
ProductCategoriesYY- >
.YY> ?
GetAllAsyncYY? J
(YYJ K
)YYK L
;YYL M
}ZZ 	
publicaa 
asyncaa 
Taskaa 
<aa 
Paggingaa !
<aa! "
ProductCategoryaa" 1
>aa1 2
>aa2 3,
 GetProductCategoriesPaggingAsyncaa4 T
(aaT U

PaginationaaU _

paginationaa` j
)aaj k
{bb 	
ifcc 
(cc 

paginationcc 
.cc 
Filtercc !
.cc! "%
IsNullOrEmptyOrWhiteSpacecc" ;
(cc; <
)cc< =
)cc= >
returncc? E
awaitccF K
_productCategoryUoWccL _
.cc_ `
ProductCategoriescc` q
.ccq r
GetPaggingAsync	ccr Å
(
ccÅ Ç

pagination
ccÇ å
)
ccå ç
;
ccç é
vardd 

pageResultdd 
=dd 
awaitdd "
_productCategoryUoWdd# 6
.dd6 7
ProductCategoriesdd7 H
.ddH I
GetPaggingAsyncddI X
(ddX Y

paginationddY c
,ddc d
xdde f
=>ddg i
xddj k
.ddk l
nameddl p
.ddp q
ContainsTextddq }
(dd} ~

pagination	dd~ à
.
ddà â
Filter
ddâ è
)
ddè ê
)
ddê ë
;
ddë í
returnee 

pageResultee 
;ee 
}ff 	
publicmm 
asyncmm 
Taskmm 
<mm 
ProductCategorymm )
>mm) *#
GetProductCategoryAsyncmm+ B
(mmB C
stringmmC I
productCategoryIdmmJ [
)mm[ \
{nn 	
returnoo 
awaitoo 
_productCategoryUoWoo ,
.oo, -
ProductCategoriesoo- >
.oo> ?
GetByIdAsyncoo? K
(ooK L
productCategoryIdooL ]
)oo] ^
;oo^ _
}pp 	
publicww 
asyncww 
Taskww 
<ww 
boolww 
>ww &
InsertProductCategoryAsyncww  :
(ww: ;
ProductCategoryww; J
productCategorywwK Z
)wwZ [
{xx 	
varyy !
productCategoryInsertyy %
=yy& '
awaityy( -
_productCategoryUoWyy. A
.yyA B
ProductCategoriesyyB S
.yyS T
InsertOneAsyncyyT b
(yyb c
productCategoryyyc r
)yyr s
;yys t
returnzz !
productCategoryInsertzz (
!=zz) +
nullzz, 0
;zz0 1
}{{ 	
public
ÇÇ 
async
ÇÇ 
Task
ÇÇ 
<
ÇÇ 
bool
ÇÇ 
>
ÇÇ (
UpdateProductCategoryAsync
ÇÇ  :
(
ÇÇ: ;
ProductCategory
ÇÇ; J
productCategory
ÇÇK Z
)
ÇÇZ [
{
ÉÉ 	
return
ÑÑ 
await
ÑÑ !
_productCategoryUoW
ÑÑ ,
.
ÑÑ, -
ProductCategories
ÑÑ- >
.
ÑÑ> ?
UpdateOneAsync
ÑÑ? M
(
ÑÑM N
productCategory
ÑÑN ]
)
ÑÑ] ^
;
ÑÑ^ _
}
ÖÖ 	
public
èè 
async
èè 
Task
èè 
<
èè 
DeleteStatus
èè &
>
èè& ' 
DeleteProductAsync
èè( :
(
èè: ;
Product
èè; B
product
èèC J
)
èèJ K
{
êê 	
try
ëë 
{
íí 
var
ïï 

orderItems
ïï 
=
ïï  
await
ïï! &
_orderItemUoW
ïï' 4
.
ïï4 5

OrderItems
ïï5 ?
.
ïï? @
GetAllAsync
ïï@ K
(
ïïK L
x
ïïL M
=>
ïïN P
x
ïïQ R
.
ïïR S

product_id
ïïS ]
==
ïï^ `
product
ïïa h
.
ïïh i
id
ïïi k
)
ïïk l
;
ïïl m
if
óó 
(
óó 

orderItems
óó 
!=
óó !
null
óó" &
&&
óó' )

orderItems
óó* 4
.
óó4 5
Count
óó5 :
(
óó: ;
)
óó; <
>
óó= >
$num
óó? @
)
óó@ A
return
óóB H
DeleteStatus
óóI U
.
óóU V
Incurred
óóV ^
;
óó^ _
var
ôô 
images
ôô 
=
ôô 
await
ôô "
	_imageUoW
ôô# ,
.
ôô, -
Images
ôô- 3
.
ôô3 4
GetAllAsync
ôô4 ?
(
ôô? @
x
ôô@ A
=>
ôôB D
x
ôôE F
.
ôôF G

product_id
ôôG Q
==
ôôR T
product
ôôU \
.
ôô\ ]
id
ôô] _
)
ôô_ `
;
ôô` a
if
öö 
(
öö 
images
öö 
.
öö 
CountExt
öö #
(
öö# $
)
öö$ %
>
öö& '
$num
öö( )
)
öö) *
{
õõ 
await
ùù &
DeleteImagesProductAsync
ùù 2
(
ùù2 3
product
ùù3 :
.
ùù: ;
id
ùù; =
,
ùù= >
images
ùù? E
.
ùùE F
	SelectExt
ùùF O
(
ùùO P
x
ùùP Q
=>
ùùR T
x
ùùU V
.
ùùV W
path
ùùW [
)
ùù[ \
.
ùù\ ]
ToList
ùù] c
(
ùùc d
)
ùùd e
)
ùùe f
;
ùùf g
}
ûû 
await
†† 
	_imageUoW
†† 
.
††  
Images
††  &
.
††& '
DeleteManyAsync
††' 6
(
††6 7
x
††7 8
=>
††9 ;
x
††< =
.
††= >

product_id
††> H
==
††I K
product
††L S
.
††S T
id
††T V
)
††V W
;
††W X
var
££ 
	resDelete
££ 
=
££ 
await
££  %
_productUoW
££& 1
.
££1 2
Products
££2 :
.
££: ;
DeleteOneAsync
££; I
(
££I J
product
££J Q
)
££Q R
;
££R S
return
§§ 
	resDelete
§§  
?
§§! "
DeleteStatus
§§# /
.
§§/ 0
Success
§§0 7
:
§§8 9
DeleteStatus
§§: F
.
§§F G
Fail
§§G K
;
§§K L
}
•• 
catch
¶¶ 
(
¶¶ 
	Exception
¶¶ 
ex
¶¶ 
)
¶¶  
{
ßß 
return
®® 
DeleteStatus
®® #
.
®®# $
Fail
®®$ (
;
®®( )
}
©© 
}
™™ 	
public
±± 
async
±± 
Task
±± 
<
±± 
DeleteStatus
±± &
>
±±& '!
DeleteProductsAsync
±±( ;
(
±±; <
IEnumerable
±±< G
<
±±G H
Product
±±H O
>
±±O P
products
±±Q Y
)
±±Y Z
{
≤≤ 	
try
≥≥ 
{
¥¥ 
if
µµ 
(
µµ 
products
µµ 
==
µµ 
null
µµ  $
&&
µµ% '
products
µµ( 0
.
µµ0 1
Count
µµ1 6
(
µµ6 7
)
µµ7 8
<=
µµ9 ;
$num
µµ< =
)
µµ= >
return
µµ? E
DeleteStatus
µµF R
.
µµR S
None
µµS W
;
µµW X
var
ππ 

orderItems
ππ 
=
ππ  
await
ππ! &
_orderItemUoW
ππ' 4
.
ππ4 5

OrderItems
ππ5 ?
.
ππ? @
GetAllAsync
ππ@ K
(
ππK L
x
ππL M
=>
ππN P
products
ππQ Y
.
ππY Z
Any
ππZ ]
(
ππ] ^
p
ππ^ _
=>
ππ` b
p
ππc d
.
ππd e
id
ππe g
==
ππh j
x
ππk l
.
ππl m

product_id
ππm w
)
ππw x
)
ππx y
;
ππy z
if
ªª 
(
ªª 

orderItems
ªª 
!=
ªª !
null
ªª" &
&&
ªª' )

orderItems
ªª* 4
.
ªª4 5
Count
ªª5 :
(
ªª: ;
)
ªª; <
>
ªª= >
$num
ªª? @
)
ªª@ A
return
ªªB H
DeleteStatus
ªªI U
.
ªªU V
Incurred
ªªV ^
;
ªª^ _
await
ææ 
	_imageUoW
ææ 
.
ææ  
Images
ææ  &
.
ææ& '
DeleteManyAsync
ææ' 6
(
ææ6 7
x
ææ7 8
=>
ææ9 ;
products
ææ< D
.
ææD E
Any
ææE H
(
ææH I
p
ææI J
=>
ææK M
p
ææN O
.
ææO P
id
ææP R
==
ææS U
x
ææV W
.
ææW X

product_id
ææX b
)
ææb c
)
ææc d
;
ææd e
var
¬¬ 
	resDelete
¬¬ 
=
¬¬ 
await
¬¬  %
_productUoW
¬¬& 1
.
¬¬1 2
Products
¬¬2 :
.
¬¬: ;
DeleteManyAsync
¬¬; J
(
¬¬J K
products
¬¬K S
)
¬¬S T
;
¬¬T U
return
√√ 
	resDelete
√√  
?
√√! "
DeleteStatus
√√# /
.
√√/ 0
Success
√√0 7
:
√√8 9
DeleteStatus
√√: F
.
√√F G
Fail
√√G K
;
√√K L
}
ƒƒ 
catch
≈≈ 
(
≈≈ 
	Exception
≈≈ 
ex
≈≈ 
)
≈≈  
{
∆∆ 
return
«« 
DeleteStatus
«« #
.
««# $
Fail
««$ (
;
««( )
}
»» 
}
…… 	
public
œœ 
async
œœ 
Task
œœ 
<
œœ 
IEnumerable
œœ %
<
œœ% &
Product
œœ& -
>
œœ- .
>
œœ. /
GetProductsAsync
œœ0 @
(
œœ@ A
)
œœA B
{
–– 	
return
—— 
await
—— 
_productUoW
—— $
.
——$ %
Products
——% -
.
——- .
GetAllAsync
——. 9
(
——9 :
)
——: ;
;
——; <
}
““ 	
public
ŸŸ 
async
ŸŸ 
Task
ŸŸ 
<
ŸŸ 
Pagging
ŸŸ !
<
ŸŸ! "
ProductRespone
ŸŸ" 0
>
ŸŸ0 1
>
ŸŸ1 2%
GetProductsPaggingAsync
ŸŸ3 J
(
ŸŸJ K"
ProductFilterRequest
ŸŸK _
request
ŸŸ` g
,
ŸŸg h
bool
ŸŸi m
isAdmin
ŸŸn u
)
ŸŸu v
{
⁄⁄ 	
var
€€ 

pageResult
€€ 
=
€€ 
new
€€  
Pagging
€€! (
<
€€( )
ProductRespone
€€) 7
>
€€7 8
(
€€8 9
)
€€9 :
;
€€: ;
try
‹‹ 
{
›› 
var
ﬁﬁ 
productPage
ﬁﬁ 
=
ﬁﬁ  !
await
ﬁﬁ" '
_productUoW
ﬁﬁ( 3
.
ﬁﬁ3 4%
GetProductsPaggingAsync
ﬁﬁ4 K
(
ﬁﬁK L
request
ﬁﬁL S
)
ﬁﬁS T
;
ﬁﬁT U
if
ﬂﬂ 
(
ﬂﬂ 
productPage
ﬂﬂ 
==
ﬂﬂ  "
null
ﬂﬂ# '
||
ﬂﬂ( *
productPage
ﬂﬂ+ 6
.
ﬂﬂ6 7
Data
ﬂﬂ7 ;
==
ﬂﬂ< >
null
ﬂﬂ? C
||
ﬂﬂD F
productPage
ﬂﬂG R
.
ﬂﬂR S
Data
ﬂﬂS W
.
ﬂﬂW X
CountExt
ﬂﬂX `
(
ﬂﬂ` a
)
ﬂﬂa b
<=
ﬂﬂc e
$num
ﬂﬂf g
)
ﬂﬂg h
return
ﬂﬂi o

pageResult
ﬂﬂp z
;
ﬂﬂz {
if
‡‡ 
(
‡‡ 
productPage
‡‡ 
!=
‡‡  "
null
‡‡# '
)
‡‡' (
{
·· 

pageResult
‚‚ 
=
‚‚  
new
‚‚! $
Pagging
‚‚% ,
<
‚‚, -
ProductRespone
‚‚- ;
>
‚‚; <
{
„„ 
Data
‰‰ 
=
‰‰ 
productPage
‰‰ *
.
‰‰* +
Data
‰‰+ /
!=
‰‰0 2
null
‰‰3 7
?
‰‰8 9
productPage
‰‰: E
.
‰‰E F
Data
‰‰F J
.
‰‰J K
Select
‰‰K Q
(
‰‰Q R
product
‰‰R Y
=>
‰‰Z \
MapperExtensions
‰‰] m
.
‰‰m n

MapperData
‰‰n x
<
‰‰x y
Product‰‰y Ä
,‰‰Ä Å
ProductRespone‰‰Ç ê
>‰‰ê ë
(‰‰ë í
product‰‰í ô
)‰‰ô ö
)‰‰ö õ
.‰‰õ ú
ToList‰‰ú ¢
(‰‰¢ £
)‰‰£ §
:‰‰• ¶
null‰‰ß ´
,‰‰´ ¨
	PageIndex
ÂÂ !
=
ÂÂ" #
productPage
ÂÂ$ /
.
ÂÂ/ 0
	PageIndex
ÂÂ0 9
,
ÂÂ9 :
PageSize
ÊÊ  
=
ÊÊ! "
productPage
ÊÊ# .
.
ÊÊ. /
PageSize
ÊÊ/ 7
,
ÊÊ7 8

TotalPages
ÁÁ "
=
ÁÁ# $
productPage
ÁÁ% 0
.
ÁÁ0 1

TotalPages
ÁÁ1 ;
,
ÁÁ; <
TotalRecord
ËË #
=
ËË$ %
productPage
ËË& 1
.
ËË1 2
TotalRecord
ËË2 =
}
ÈÈ 
;
ÈÈ 
if
ÎÎ 
(
ÎÎ 
!
ÎÎ 
isAdmin
ÎÎ  
)
ÎÎ  !
{
ÏÏ 
if
ÓÓ 
(
ÓÓ 

pageResult
ÓÓ &
.
ÓÓ& '
Data
ÓÓ' +
!=
ÓÓ, .
null
ÓÓ/ 3
&&
ÓÓ4 6

pageResult
ÓÓ7 A
.
ÓÓA B
Data
ÓÓB F
.
ÓÓF G
CountExt
ÓÓG O
(
ÓÓO P
)
ÓÓP Q
>
ÓÓR S
$num
ÓÓT U
)
ÓÓU V
{
ÔÔ 
for
 
(
  !
int
! $
index
% *
=
+ ,
$num
- .
;
. /
index
0 5
<
6 7

pageResult
8 B
.
B C
Data
C G
.
G H
CountExt
H P
(
P Q
)
Q R
;
R S
index
T Y
++
Y [
)
[ \
{
ÒÒ 
var
ÚÚ  #
product
ÚÚ$ +
=
ÚÚ, -

pageResult
ÚÚ. 8
.
ÚÚ8 9
Data
ÚÚ9 =
[
ÚÚ= >
index
ÚÚ> C
]
ÚÚC D
;
ÚÚD E
if
ÙÙ  "
(
ÙÙ# $
product
ÙÙ$ +
.
ÙÙ+ ,
files
ÙÙ, 1
==
ÙÙ2 4
null
ÙÙ5 9
)
ÙÙ9 :
product
ÙÙ; B
.
ÙÙB C
files
ÙÙC H
=
ÙÙI J
new
ÙÙK N
List
ÙÙO S
<
ÙÙS T
FileInfo
ÙÙT \
>
ÙÙ\ ]
(
ÙÙ] ^
)
ÙÙ^ _
;
ÙÙ_ `
var
ˆˆ  #
base64Images
ˆˆ$ 0
=
ˆˆ1 2
await
ˆˆ3 8)
GetBase64ImagesProductAsync
ˆˆ9 T
(
ˆˆT U
product
ˆˆU \
.
ˆˆ\ ]
id
ˆˆ] _
)
ˆˆ_ `
;
ˆˆ` a
if
˜˜  "
(
˜˜# $
base64Images
˜˜$ 0
!=
˜˜1 3
null
˜˜4 8
&&
˜˜9 ;
base64Images
˜˜< H
.
˜˜H I
CountExt
˜˜I Q
(
˜˜Q R
)
˜˜R S
>
˜˜T U
$num
˜˜V W
)
˜˜W X
{
¯¯  !
product
˘˘$ +
.
˘˘+ ,
files
˘˘, 1
=
˘˘2 3
base64Images
˘˘4 @
.
˘˘@ A
	SelectExt
˘˘A J
(
˘˘J K
x
˘˘K L
=>
˘˘M O
new
˘˘P S
FileInfo
˘˘T \
{
˘˘] ^
path
˘˘_ c
=
˘˘d e
x
˘˘f g
}
˘˘h i
)
˘˘i j
.
˘˘j k
ToList
˘˘k q
(
˘˘q r
)
˘˘r s
;
˘˘s t
if
˙˙$ &
(
˙˙' (
product
˙˙( /
.
˙˙/ 0
files
˙˙0 5
.
˙˙5 6
CountExt
˙˙6 >
(
˙˙> ?
)
˙˙? @
<=
˙˙A C
$num
˙˙D E
)
˙˙E F
continue
˙˙G O
;
˙˙O P

pageResult
˚˚$ .
.
˚˚. /
Data
˚˚/ 3
[
˚˚3 4
index
˚˚4 9
]
˚˚9 :
.
˚˚: ;
files
˚˚; @
=
˚˚A B
product
˚˚C J
.
˚˚J K
files
˚˚K P
;
˚˚P Q
}
¸¸  !
var
ˇˇ  #
colors
ˇˇ$ *
=
ˇˇ+ ,
await
ˇˇ- 2
	_colorUoW
ˇˇ3 <
.
ˇˇ< =
Colors
ˇˇ= C
.
ˇˇC D
GetAllAsync
ˇˇD O
(
ˇˇO P
x
ˇˇP Q
=>
ˇˇR T
x
ˇˇU V
.
ˇˇV W

product_id
ˇˇW a
==
ˇˇb d
product
ˇˇe l
.
ˇˇl m
id
ˇˇm o
)
ˇˇo p
;
ˇˇp q
if
ÄÄ  "
(
ÄÄ# $
colors
ÄÄ$ *
.
ÄÄ* +
CountExt
ÄÄ+ 3
(
ÄÄ3 4
)
ÄÄ4 5
>
ÄÄ6 7
$num
ÄÄ8 9
)
ÄÄ9 :
{
ÄÄ; <

pageResult
ÄÄ= G
.
ÄÄG H
Data
ÄÄH L
[
ÄÄL M
index
ÄÄM R
]
ÄÄR S
.
ÄÄS T
colors
ÄÄT Z
=
ÄÄ[ \
colors
ÄÄ] c
.
ÄÄc d
ToList
ÄÄd j
(
ÄÄj k
)
ÄÄk l
;
ÄÄl m
}
ÄÄn o
}
ÅÅ 
}
ÇÇ 
}
ÉÉ 
}
ÑÑ 
}
ÖÖ 
catch
ÜÜ 
(
ÜÜ 
	Exception
ÜÜ 
ex
ÜÜ 
)
ÜÜ  
{
áá 
_logger
àà 
.
àà 

LogWarning
àà "
(
àà" #
ex
àà# %
,
àà% &
$"
àà' )
{
àà) *
TAG
àà* -
}
àà- .
$str
àà. \
{
àà\ ]
ex
àà] _
.
àà_ `
Message
àà` g
}
ààg h
"
ààh i
)
àài j
;
ààj k
}
ââ 
return
ãã 

pageResult
ãã 
;
ãã 
}
åå 	
public
ìì 
async
ìì 
Task
ìì 
<
ìì 
bool
ìì 
>
ìì  
InsertProductAsync
ìì  2
(
ìì2 3
ProductRequest
ìì3 A
request
ììB I
)
ììI J
{
îî 	
try
ïï 
{
ññ 
var
óó 
product
óó 
=
óó 
(
óó 
Product
óó &
)
óó& '
request
óó' .
;
óó. /
var
òò 
productInsert
òò !
=
òò" #
await
òò$ )
_productUoW
òò* 5
.
òò5 6
Products
òò6 >
.
òò> ?
InsertOneAsync
òò? M
(
òòM N
product
òòN U
)
òòU V
;
òòV W
if
öö 
(
öö 
productInsert
öö !
!=
öö" $
null
öö% )
)
öö) *
{
õõ 
if
úú 
(
úú 
request
úú 
.
úú  
files
úú  %
.
úú% &
CountExt
úú& .
(
úú. /
)
úú/ 0
>
úú1 2
$num
úú3 4
)
úú4 5
{
ùù 
await
ûû 
InsertImagesAsync
ûû /
(
ûû/ 0
request
ûû0 7
.
ûû7 8
files
ûû8 =
,
ûû= >
request
ûû? F
.
ûûF G
id
ûûG I
)
ûûI J
;
ûûJ K
}
üü 
if
¢¢ 
(
¢¢ 
request
¢¢ 
.
¢¢  
colors
¢¢  &
.
¢¢& '
CountExt
¢¢' /
(
¢¢/ 0
)
¢¢0 1
>
¢¢2 3
$num
¢¢4 5
)
¢¢5 6
{
££ 
request
•• 
.
••  
colors
••  &
.
••& '
ForEach
••' .
(
••. /
x
••/ 0
=>
••1 3
x
••4 5
.
••5 6

product_id
••6 @
=
••A B
productInsert
••C P
.
••P Q
id
••Q S
)
••S T
;
••T U
var
¶¶ 
insertColos
¶¶ '
=
¶¶( )
await
¶¶* /
	_colorUoW
¶¶0 9
.
¶¶9 :
Colors
¶¶: @
.
¶¶@ A
InsertManyAsync
¶¶A P
(
¶¶P Q
request
¶¶Q X
.
¶¶X Y
colors
¶¶Y _
)
¶¶_ `
;
¶¶` a
if
ßß 
(
ßß 
insertColos
ßß '
.
ßß' (
CountExt
ßß( 0
(
ßß0 1
)
ßß1 2
>
ßß3 4
$num
ßß5 6
)
ßß6 7
{
®® 
productInsert
©© )
.
©©) *
quantity
©©* 2
=
©©3 4
request
©©5 <
.
©©< =
colors
©©= C
.
©©C D
SumExt
©©D J
(
©©J K
x
©©K L
=>
©©M O
x
©©P Q
.
©©Q R
amount
©©R X
)
©©X Y
;
©©Y Z
await
™™ !
_productUoW
™™" -
.
™™- .
Products
™™. 6
.
™™6 7
UpdateOneAsync
™™7 E
(
™™E F
productInsert
™™F S
)
™™S T
;
™™T U
}
´´ 
}
¨¨ 
}
≠≠ 
return
ÆÆ 
productInsert
ÆÆ $
!=
ÆÆ% '
null
ÆÆ( ,
;
ÆÆ, -
}
ØØ 
catch
∞∞ 
(
∞∞ 
	Exception
∞∞ 
ex
∞∞ 
)
∞∞  
{
±± 
return
≤≤ 
false
≤≤ 
;
≤≤ 
}
≥≥ 
}
¥¥ 	
public
ºº 
async
ºº 
Task
ºº 
<
ºº 
bool
ºº 
>
ºº  
UpdateProductAsync
ºº  2
(
ºº2 3
ProductRequest
ºº3 A
productRequest
ººB P
)
ººP Q
{
ΩΩ 	
var
ææ 
product
ææ 
=
ææ 
MapperExtensions
ææ *
.
ææ* +

MapperData
ææ+ 5
<
ææ5 6
ProductRequest
ææ6 D
,
ææD E
Product
ææF M
>
ææM N
(
ææN O
productRequest
ææO ]
)
ææ] ^
;
ææ^ _
var
øø 
productUpdate
øø 
=
øø 
await
øø  %
_productUoW
øø& 1
.
øø1 2
Products
øø2 :
.
øø: ;
UpdateOneAsync
øø; I
(
øøI J
product
øøJ Q
)
øøQ R
;
øøR S
if
¿¿ 
(
¿¿ 
!
¿¿ 
productUpdate
¿¿ 
)
¿¿ 
return
¿¿  &
false
¿¿' ,
;
¿¿, -
if
√√ 
(
√√ 
productRequest
√√ 
.
√√ 
files
√√ $
==
√√% '
null
√√( ,
||
√√- /
productRequest
√√0 >
.
√√> ?
files
√√? D
.
√√D E
CountExt
√√E M
(
√√M N
)
√√N O
<=
√√P R
$num
√√S T
)
√√T U
return
√√V \
productUpdate
√√] j
;
√√j k
var
≈≈ 
files
≈≈ 
=
≈≈ 
productRequest
≈≈ &
.
≈≈& '
files
≈≈' ,
.
≈≈, -
Where
≈≈- 2
(
≈≈2 3
x
≈≈3 4
=>
≈≈5 7
!
≈≈8 9
x
≈≈9 :
.
≈≈: ;
path
≈≈; ?
.
≈≈? @'
IsNullOrEmptyOrWhiteSpace
≈≈@ Y
(
≈≈Y Z
)
≈≈Z [
)
≈≈[ \
.
≈≈\ ]
ToList
≈≈] c
(
≈≈c d
)
≈≈d e
;
≈≈e f
var
«« 
images
«« 
=
«« 
await
«« 
	_imageUoW
«« (
.
««( )
Images
««) /
.
««/ 0
GetAllAsync
««0 ;
(
««; <
x
««< =
=>
««> @
x
««A B
.
««B C

product_id
««C M
==
««N P
productRequest
««Q _
.
««_ `
id
««` b
)
««b c
;
««c d
var
   
updateColors
   
=
   
await
   $ 
UpdateColorProduct
  % 7
(
  7 8
product
  8 ?
,
  ? @
productRequest
  A O
.
  O P
colors
  P V
)
  V W
;
  W X
if
ÃÃ 
(
ÃÃ 
updateColors
ÃÃ 
)
ÃÃ 
{
ÕÕ 
await
ŒŒ 
_productUoW
ŒŒ !
.
ŒŒ! "
Products
ŒŒ" *
.
ŒŒ* +
UpdateOneAsync
ŒŒ+ 9
(
ŒŒ9 :
product
ŒŒ: A
)
ŒŒA B
;
ŒŒB C
}
œœ 
return
–– 
productUpdate
––  
;
––  !
}
—— 	
public
ÿÿ 
async
ÿÿ 
Task
ÿÿ 
<
ÿÿ 
ProductRespone
ÿÿ (
>
ÿÿ( )
GetProductAsync
ÿÿ* 9
(
ÿÿ9 :
string
ÿÿ: @
	productId
ÿÿA J
)
ÿÿJ K
{
ŸŸ 	
var
⁄⁄ 
productRespone
⁄⁄ 
=
⁄⁄  
new
⁄⁄! $
ProductRespone
⁄⁄% 3
(
⁄⁄3 4
)
⁄⁄4 5
;
⁄⁄5 6
var
€€ 
product
€€ 
=
€€ 
await
€€ 
_productUoW
€€  +
.
€€+ ,
Products
€€, 4
.
€€4 5
GetByIdAsync
€€5 A
(
€€A B
	productId
€€B K
)
€€K L
;
€€L M
if
‹‹ 
(
‹‹ 
product
‹‹ 
==
‹‹ 
null
‹‹ 
)
‹‹  
return
‹‹! '
null
‹‹( ,
;
‹‹, -
productRespone
ﬁﬁ 
=
ﬁﬁ 
MapperExtensions
ﬁﬁ -
.
ﬁﬁ- .

MapperData
ﬁﬁ. 8
<
ﬁﬁ8 9
Product
ﬁﬁ9 @
,
ﬁﬁ@ A
ProductRespone
ﬁﬁB P
>
ﬁﬁP Q
(
ﬁﬁQ R
product
ﬁﬁR Y
)
ﬁﬁY Z
;
ﬁﬁZ [
if
·· 
(
·· 
productRespone
·· 
.
·· 
files
·· $
==
··% '
null
··( ,
)
··, -
productRespone
··. <
.
··< =
files
··= B
=
··C D
new
··E H
List
··I M
<
··M N
FileInfo
··N V
>
··V W
(
··W X
)
··X Y
;
··Y Z
var
„„ 
pathImagesProduct
„„ !
=
„„" #
FileExtensions
„„$ 2
.
„„2 3!
GetPathProductLocal
„„3 F
(
„„F G
)
„„G H
;
„„H I
var
‰‰ 
base64Images
‰‰ 
=
‰‰ 
await
‰‰ $)
GetBase64ImagesProductAsync
‰‰% @
(
‰‰@ A
product
‰‰A H
.
‰‰H I
id
‰‰I K
,
‰‰K L
true
‰‰M Q
)
‰‰Q R
;
‰‰R S
if
ÂÂ 
(
ÂÂ 
base64Images
ÂÂ 
!=
ÂÂ 
null
ÂÂ  $
&&
ÂÂ% '
base64Images
ÂÂ( 4
.
ÂÂ4 5
CountExt
ÂÂ5 =
(
ÂÂ= >
)
ÂÂ> ?
>
ÂÂ@ A
$num
ÂÂB C
)
ÂÂC D
{
ÊÊ 
productRespone
ÁÁ 
.
ÁÁ 
files
ÁÁ $
=
ÁÁ% &
base64Images
ÁÁ' 3
.
ÁÁ3 4
	SelectExt
ÁÁ4 =
(
ÁÁ= >
x
ÁÁ> ?
=>
ÁÁ@ B
new
ÁÁC F
FileInfo
ÁÁG O
{
ÁÁP Q
path
ÁÁR V
=
ÁÁW X
x
ÁÁY Z
}
ÁÁ[ \
)
ÁÁ\ ]
.
ÁÁ] ^
ToList
ÁÁ^ d
(
ÁÁd e
)
ÁÁe f
;
ÁÁf g
}
ËË 
var
ÎÎ 
colors
ÎÎ 
=
ÎÎ 
await
ÎÎ 
	_colorUoW
ÎÎ (
.
ÎÎ( )
Colors
ÎÎ) /
.
ÎÎ/ 0
GetAllAsync
ÎÎ0 ;
(
ÎÎ; <
x
ÎÎ< =
=>
ÎÎ> @
x
ÎÎA B
.
ÎÎB C

product_id
ÎÎC M
==
ÎÎN P
product
ÎÎQ X
.
ÎÎX Y
id
ÎÎY [
)
ÎÎ[ \
;
ÎÎ\ ]
if
ÏÏ 
(
ÏÏ 
colors
ÏÏ 
.
ÏÏ 
CountExt
ÏÏ 
(
ÏÏ  
)
ÏÏ  !
>
ÏÏ" #
$num
ÏÏ$ %
)
ÏÏ% &
{
ÏÏ' (
productRespone
ÏÏ) 7
.
ÏÏ7 8
colors
ÏÏ8 >
=
ÏÏ? @
colors
ÏÏA G
.
ÏÏG H
ToList
ÏÏH N
(
ÏÏN O
)
ÏÏO P
;
ÏÏP Q
}
ÏÏR S
return
ÌÌ 
productRespone
ÌÌ !
;
ÌÌ! "
}
ÓÓ 	
private
¯¯ 
async
¯¯ 
Task
¯¯ 
<
¯¯ 
bool
¯¯ 
>
¯¯  
InsertImagesAsync
¯¯! 2
(
¯¯2 3
List
¯¯3 7
<
¯¯7 8
FileInfo
¯¯8 @
>
¯¯@ A
	fileInfos
¯¯B K
,
¯¯K L
string
¯¯M S
	productId
¯¯T ]
)
¯¯] ^
{
˘˘ 	
try
˙˙ 
{
˚˚ 
if
¸¸ 
(
¸¸ 
	fileInfos
¸¸ 
.
¸¸ 
CountExt
¸¸ &
(
¸¸& '
)
¸¸' (
<=
¸¸) +
$num
¸¸, -
)
¸¸- .
return
¸¸/ 5
false
¸¸6 ;
;
¸¸; <
var
˝˝ 
imagesInsert
˝˝  
=
˝˝! "
	fileInfos
˝˝# ,
.
˝˝, -
Select
˝˝- 3
(
˝˝3 4
(
˝˝4 5
x
˝˝5 6
,
˝˝6 7
index
˝˝8 =
)
˝˝= >
=>
˝˝? A
new
˝˝B E
Image
˝˝F K
(
˝˝K L
)
˝˝L M
{
˛˛ 
path
ˇˇ 
=
ˇˇ 
GlobalConstant
ˇˇ )
.
ˇˇ) * 
GetFullPathProduct
ˇˇ* <
(
ˇˇ< =
$"
ˇˇ= ?
{
ˇˇ? @
	productId
ˇˇ@ I
}
ˇˇI J
$str
ˇˇJ K
{
ˇˇK L
Guid
ˇˇL P
.
ˇˇP Q
NewGuid
ˇˇQ X
(
ˇˇX Y
)
ˇˇY Z
}
ˇˇZ [
"
ˇˇ[ \
,
ˇˇ\ ]
FileExtensions
ˇˇ^ l
.
ˇˇl m
GetFileExtention
ˇˇm }
(
ˇˇ} ~
FileTypeˇˇ~ Ü
.ˇˇÜ á
Imageˇˇá å
)ˇˇå ç
)ˇˇç é
,ˇˇé è

product_id
ÄÄ 
=
ÄÄ  
	productId
ÄÄ! *
,
ÄÄ* +
	is_picked
ÅÅ 
=
ÅÅ 
true
ÅÅ  $
}
ÇÇ 
)
ÇÇ 
.
ÇÇ 
ToList
ÇÇ 
(
ÇÇ 
)
ÇÇ 
;
ÇÇ 
var
ÑÑ 
insertImage
ÑÑ 
=
ÑÑ  !
await
ÑÑ" '
	_imageUoW
ÑÑ( 1
.
ÑÑ1 2
Images
ÑÑ2 8
.
ÑÑ8 9
InsertManyAsync
ÑÑ9 H
(
ÑÑH I
imagesInsert
ÑÑI U
)
ÑÑU V
;
ÑÑV W
if
ÖÖ 
(
ÖÖ 
insertImage
ÖÖ 
.
ÖÖ  
CountExt
ÖÖ  (
(
ÖÖ( )
)
ÖÖ) *
>
ÖÖ+ ,
$num
ÖÖ- .
)
ÖÖ. /
{
ÜÜ 
for
áá 
(
áá 
int
áá 
index
áá "
=
áá# $
$num
áá% &
;
áá& '
index
áá( -
<
áá. /
	fileInfos
áá0 9
.
áá9 :
CountExt
áá: B
(
ááB C
)
ááC D
;
ááD E
index
ááF K
++
ááK M
)
ááM N
{
àà 
var
ââ 
byteFile
ââ $
=
ââ% &
ConvertExtensions
ââ' 8
.
ââ8 9
ConvertFromBase64
ââ9 J
(
ââJ K
	fileInfos
ââK T
[
ââT U
index
ââU Z
]
ââZ [
.
ââ[ \
path
ââ\ `
)
ââ` a
;
ââa b
var
ää 
insertStorage
ää )
=
ää* +
await
ää, 1
_storageClient
ää2 @
.
ää@ A
UploadFileAsync
ääA P
(
ääP Q
imagesInsert
ääQ ]
[
ää] ^
index
ää^ c
]
ääc d
.
ääd e
path
ääe i
,
ääi j
byteFile
ääk s
)
ääs t
;
äät u
if
ãã 
(
ãã 
insertStorage
ãã )
)
ãã) *
{
åå 
var
çç 
keyPathStorage
çç  .
=
çç/ 0'
GetKeyCachedProductImages
çç1 J
(
ççJ K
	productId
ççK T
)
ççT U
;
ççU V
await
èè !
_cached
èè" )
.
èè) *
SetAsync
èè* 2
(
èè2 3
keyPathStorage
èè3 A
,
èèA B
insertImage
èèC N
.
èèN O
	SelectExt
èèO X
(
èèX Y
x
èèY Z
=>
èè[ ]
x
èè^ _
.
èè_ `
path
èè` d
)
èèd e
.
èèe f
ToList
èèf l
(
èèl m
)
èèm n
,
èèn o
$num
èèp r
*
èès t
$num
èèu w
*
èèx y
$num
èèz |
)
èè| }
;
èè} ~
}
êê 
}
ëë 
return
íí 
true
íí 
;
íí  
}
ìì 
return
îî 
false
îî 
;
îî 
}
ïï 
catch
ññ 
(
ññ 
	Exception
ññ 
ex
ññ 
)
ññ  
{
óó 
return
òò 
false
òò 
;
òò 
}
ôô 
}
öö 	
private
úú 
async
úú 
Task
úú 
<
úú 
bool
úú 
>
úú   
UpdateColorProduct
úú! 3
(
úú3 4
Product
úú4 ;
product
úú< C
,
úúC D
List
úúE I
<
úúI J
Color
úúJ O
>
úúO P
colors
úúQ W
)
úúW X
{
ùù 	
try
ûû 
{
üü 
if
†† 
(
†† 
colors
†† 
.
†† 
CountExt
†† #
(
††# $
)
††$ %
<=
††& (
$num
††) *
)
††* +
return
††, 2
false
††3 8
;
††8 9
colors
¢¢ 
.
¢¢ 
ForEach
¢¢ 
(
¢¢ 
x
¢¢  
=>
¢¢! #
x
¢¢$ %
.
¢¢% &

product_id
¢¢& 0
=
¢¢1 2
product
¢¢3 :
.
¢¢: ;
id
¢¢; =
)
¢¢= >
;
¢¢> ?
var
§§ 
colorsDb
§§ 
=
§§ 
await
§§ $
	_colorUoW
§§% .
.
§§. /
Colors
§§/ 5
.
§§5 6
GetAllAsync
§§6 A
(
§§A B
x
§§B C
=>
§§D F
x
§§G H
.
§§H I

product_id
§§I S
==
§§T V
product
§§W ^
.
§§^ _
id
§§_ a
)
§§a b
;
§§b c
if
•• 
(
•• 
colorsDb
•• 
.
•• 
CountExt
•• %
(
••% &
)
••& '
<=
••( *
$num
••+ ,
)
••, -
return
••. 4
false
••5 :
;
••: ;
var
¶¶ 
quantity
¶¶ 
=
¶¶ 
$num
¶¶  
;
¶¶  !
var
®® 
colorsInsert
®®  
=
®®! "
colors
®®# )
.
®®) *
WhereExt
®®* 2
(
®®2 3
x
®®3 4
=>
®®5 7
!
®®8 9
colorsDb
®®9 A
.
®®A B
ToList
®®B H
(
®®H I
)
®®I J
.
®®J K
Exists
®®K Q
(
®®Q R
c
®®R S
=>
®®T V
x
®®W X
.
®®X Y
id
®®Y [
.
®®[ \
Equals
®®\ b
(
®®b c
c
®®c d
.
®®d e
id
®®e g
)
®®g h
)
®®h i
)
®®i j
.
®®j k
ToList
®®k q
(
®®q r
)
®®r s
;
®®s t
if
©© 
(
©© 
colorsInsert
©©  
.
©©  !
CountExt
©©! )
(
©©) *
)
©©* +
>
©©, -
$num
©©. /
)
©©/ 0
{
™™ 
await
´´ 
	_colorUoW
´´ #
.
´´# $
Colors
´´$ *
.
´´* +
InsertManyAsync
´´+ :
(
´´: ;
colorsInsert
´´; G
)
´´G H
;
´´H I
quantity
¨¨ 
+=
¨¨ 
colorsInsert
¨¨  ,
.
¨¨, -
SumExt
¨¨- 3
(
¨¨3 4
x
¨¨4 5
=>
¨¨6 8
x
¨¨9 :
.
¨¨: ;
amount
¨¨; A
)
¨¨A B
;
¨¨B C
}
≠≠ 
var
∞∞ 
colorsUpdate
∞∞  
=
∞∞! "
colors
∞∞# )
.
∞∞) *
WhereExt
∞∞* 2
(
∞∞2 3
x
∞∞3 4
=>
∞∞5 7
colorsDb
∞∞8 @
.
∞∞@ A
ToList
∞∞A G
(
∞∞G H
)
∞∞H I
.
∞∞I J
Exists
∞∞J P
(
∞∞P Q
c
∞∞Q R
=>
∞∞S U
x
∞∞V W
.
∞∞W X
id
∞∞X Z
.
∞∞Z [
Equals
∞∞[ a
(
∞∞a b
c
∞∞b c
.
∞∞c d
id
∞∞d f
)
∞∞f g
)
∞∞g h
)
∞∞h i
.
∞∞i j
ToList
∞∞j p
(
∞∞p q
)
∞∞q r
;
∞∞r s
if
±± 
(
±± 
colorsUpdate
±±  
.
±±  !
CountExt
±±! )
(
±±) *
)
±±* +
>
±±, -
$num
±±. /
)
±±/ 0
{
≤≤ 
await
≥≥ 
	_colorUoW
≥≥ #
.
≥≥# $
Colors
≥≥$ *
.
≥≥* +
UpdateManyAsync
≥≥+ :
(
≥≥: ;
colorsUpdate
≥≥; G
)
≥≥G H
;
≥≥H I
quantity
¥¥ 
+=
¥¥ 
colorsUpdate
¥¥  ,
.
¥¥, -
SumExt
¥¥- 3
(
¥¥3 4
x
¥¥4 5
=>
¥¥6 8
x
¥¥9 :
.
¥¥: ;
amount
¥¥; A
)
¥¥A B
;
¥¥B C
}
µµ 
var
∏∏ 
colorsDelete
∏∏  
=
∏∏! "
colorsDb
∏∏# +
.
∏∏+ ,
ToList
∏∏, 2
(
∏∏2 3
)
∏∏3 4
.
∏∏4 5
WhereExt
∏∏5 =
(
∏∏= >
x
∏∏> ?
=>
∏∏@ B
!
∏∏C D
colors
∏∏D J
.
∏∏J K
Exists
∏∏K Q
(
∏∏Q R
c
∏∏R S
=>
∏∏T V
x
∏∏W X
.
∏∏X Y
id
∏∏Y [
.
∏∏[ \
Equals
∏∏\ b
(
∏∏b c
c
∏∏c d
.
∏∏d e
id
∏∏e g
)
∏∏g h
)
∏∏h i
)
∏∏i j
.
∏∏j k
ToList
∏∏k q
(
∏∏q r
)
∏∏r s
;
∏∏s t
if
ππ 
(
ππ 
colorsDelete
ππ  
.
ππ  !
CountExt
ππ! )
(
ππ) *
)
ππ* +
>
ππ, -
$num
ππ. /
)
ππ/ 0
{
∫∫ 
await
ªª 
	_colorUoW
ªª #
.
ªª# $
Colors
ªª$ *
.
ªª* +
DeleteManyAsync
ªª+ :
(
ªª: ;
colorsDelete
ªª; G
)
ªªG H
;
ªªH I
}
ºº 
product
ΩΩ 
.
ΩΩ 
quantity
ΩΩ  
=
ΩΩ! "
quantity
ΩΩ# +
;
ΩΩ+ ,
return
ææ 
true
ææ 
;
ææ 
}
øø 
catch
¿¿ 
(
¿¿ 
	Exception
¿¿ 
ex
¿¿ 
)
¿¿  
{
¡¡ 
return
¬¬ 
false
¬¬ 
;
¬¬ 
}
√√ 
}
ƒƒ 	
private
∆∆ 
async
∆∆ 
Task
∆∆ 
<
∆∆ 
bool
∆∆ 
>
∆∆  &
DeleteImagesProductAsync
∆∆! 9
(
∆∆9 :
string
∆∆: @
	productId
∆∆A J
,
∆∆J K
List
∆∆L P
<
∆∆P Q
string
∆∆Q W
>
∆∆W X
paths
∆∆Y ^
)
∆∆^ _
{
«« 	
try
»» 
{
…… 
var
   
deleteImages
    
=
  ! "
await
  # (
	_imageUoW
  ) 2
.
  2 3
Images
  3 9
.
  9 :
DeleteManyAsync
  : I
(
  I J
x
  J K
=>
  L N
x
  O P
.
  P Q

product_id
  Q [
==
  \ ^
	productId
  _ h
)
  h i
;
  i j
if
ÀÀ 
(
ÀÀ 
deleteImages
ÀÀ  
)
ÀÀ  !
{
ÃÃ 
var
ŒŒ 
	keyCached
ŒŒ !
=
ŒŒ" #'
GetKeyCachedProductImages
ŒŒ$ =
(
ŒŒ= >
	productId
ŒŒ> G
)
ŒŒG H
;
ŒŒH I
await
œœ 
_cached
œœ !
.
œœ! "
RemoveAsync
œœ" -
(
œœ- .
	keyCached
œœ. 7
)
œœ7 8
;
œœ8 9
if
–– 
(
–– 
paths
–– 
.
–– 
CountExt
–– &
(
––& '
)
––' (
>
––) *
$num
––+ ,
)
––, -
{
—— 
foreach
““ 
(
““  !
var
““! $
path
““% )
in
““* ,
paths
““- 2
)
““2 3
{
”” 
await
’’ !
_storageClient
’’" 0
.
’’0 1$
DeleteFileStorageAsync
’’1 G
(
’’G H
path
’’H L
)
’’L M
;
’’M N
}
÷÷ 
}
◊◊ 
return
ÿÿ 
true
ÿÿ 
;
ÿÿ  
}
ŸŸ 
}
⁄⁄ 
catch
€€ 
(
€€ 
	Exception
€€ 
ex
€€ 
)
€€  
{
‹‹ 
}
›› 
return
ﬁﬁ 
false
ﬁﬁ 
;
ﬁﬁ 
}
ﬂﬂ 	
private
·· 
async
·· 
Task
·· 
<
·· 
List
·· 
<
··  
string
··  &
>
··& '
>
··' (.
 GetBase64ImagesProductLocalAsync
··) I
(
··I J
string
··J P
	productId
··Q Z
,
··Z [
bool
··\ `
isGetAllImage
··a n
=
··o p
false
··q v
)
··v w
{
‚‚ 	
var
„„ 
images
„„ 
=
„„ 
new
„„ 
List
„„ !
<
„„! "
string
„„" (
>
„„( )
(
„„) *
)
„„* +
;
„„+ ,
var
‰‰ 
pathImagesProduct
‰‰ !
=
‰‰" #
$"
‰‰$ &
{
‰‰& '
FileExtensions
‰‰' 5
.
‰‰5 6!
GetPathProductLocal
‰‰6 I
(
‰‰I J
)
‰‰J K
}
‰‰K L
$str
‰‰L N
{
‰‰N O
	productId
‰‰O X
}
‰‰X Y
"
‰‰Y Z
;
‰‰Z [
var
ÂÂ 
checkFolderExist
ÂÂ  
=
ÂÂ! "
FileExtensions
ÂÂ# 1
.
ÂÂ1 2
CheckFolderExist
ÂÂ2 B
(
ÂÂB C
pathImagesProduct
ÂÂC T
)
ÂÂT U
;
ÂÂU V
if
ÊÊ 
(
ÊÊ 
!
ÊÊ 
checkFolderExist
ÊÊ !
)
ÊÊ! "
return
ÊÊ# )
images
ÊÊ* 0
;
ÊÊ0 1
System
ËË 
.
ËË 
IO
ËË 
.
ËË 
DirectoryInfo
ËË #
dir
ËË$ '
=
ËË( )
new
ËË* -
System
ËË. 4
.
ËË4 5
IO
ËË5 7
.
ËË7 8
DirectoryInfo
ËË8 E
(
ËËE F
pathImagesProduct
ËËF W
)
ËËW X
;
ËËX Y
var
ÍÍ 
filesInfolder
ÍÍ 
=
ÍÍ 
dir
ÍÍ  #
.
ÍÍ# $
GetFiles
ÍÍ$ ,
(
ÍÍ, -
$str
ÍÍ- 5
)
ÍÍ5 6
;
ÍÍ6 7
if
ÎÎ 
(
ÎÎ 
filesInfolder
ÎÎ 
==
ÎÎ  
null
ÎÎ! %
||
ÎÎ& (
filesInfolder
ÎÎ) 6
.
ÎÎ6 7
CountExt
ÎÎ7 ?
(
ÎÎ? @
)
ÎÎ@ A
<=
ÎÎB D
$num
ÎÎE F
)
ÎÎF G
return
ÎÎH N
images
ÎÎO U
;
ÎÎU V
if
ÌÌ 
(
ÌÌ 
isGetAllImage
ÌÌ 
)
ÌÌ 
{
ÓÓ 
var
 
random
 
=
 
new
  
Random
! '
(
' (
)
( )
;
) *
int
ÒÒ 
imageRandom
ÒÒ 
=
ÒÒ  !
random
ÒÒ" (
.
ÒÒ( )
Next
ÒÒ) -
(
ÒÒ- .
filesInfolder
ÒÒ. ;
.
ÒÒ; <
Length
ÒÒ< B
)
ÒÒB C
;
ÒÒC D
byte
ÚÚ 
[
ÚÚ 
]
ÚÚ 
fileData
ÚÚ 
=
ÚÚ  !
FileExtensions
ÚÚ" 0
.
ÚÚ0 1
GetDataFile
ÚÚ1 <
(
ÚÚ< =
filesInfolder
ÚÚ= J
[
ÚÚJ K
imageRandom
ÚÚK V
]
ÚÚV W
.
ÚÚW X
FullName
ÚÚX `
)
ÚÚ` a
;
ÚÚa b
var
ÛÛ 
base64Image
ÛÛ 
=
ÛÛ  !
Convert
ÛÛ" )
.
ÛÛ) *
ToBase64String
ÛÛ* 8
(
ÛÛ8 9
fileData
ÛÛ9 A
)
ÛÛA B
;
ÛÛB C
base64Image
ÙÙ 
=
ÙÙ 
$"
ÙÙ  
$str
ÙÙ  7
{
ÙÙ7 8
base64Image
ÙÙ8 C
}
ÙÙC D
"
ÙÙD E
;
ÙÙE F
if
ıı 
(
ıı 
!
ıı 
base64Image
ıı  
.
ıı  !'
IsNullOrEmptyOrWhiteSpace
ıı! :
(
ıı: ;
)
ıı; <
)
ıı< =
images
ıı> D
.
ııD E
Add
ııE H
(
ııH I
base64Image
ııI T
)
ııT U
;
ııU V
}
ˆˆ 
else
˜˜ 
{
¯¯ 
foreach
˘˘ 
(
˘˘ 
var
˘˘ 
file
˘˘ !
in
˘˘" $
filesInfolder
˘˘% 2
)
˘˘2 3
{
˙˙ 
byte
˚˚ 
[
˚˚ 
]
˚˚ 
fileData
˚˚ #
=
˚˚$ %
FileExtensions
˚˚& 4
.
˚˚4 5
GetDataFile
˚˚5 @
(
˚˚@ A
file
˚˚A E
.
˚˚E F
FullName
˚˚F N
)
˚˚N O
;
˚˚O P
var
¸¸ 
base64Image
¸¸ #
=
¸¸$ %
Convert
¸¸& -
.
¸¸- .
ToBase64String
¸¸. <
(
¸¸< =
fileData
¸¸= E
)
¸¸E F
;
¸¸F G
base64Image
˝˝ 
=
˝˝  !
$"
˝˝" $
$str
˝˝$ ;
{
˝˝; <
base64Image
˝˝< G
}
˝˝G H
"
˝˝H I
;
˝˝I J
if
˛˛ 
(
˛˛ 
!
˛˛ 
base64Image
˛˛ $
.
˛˛$ %'
IsNullOrEmptyOrWhiteSpace
˛˛% >
(
˛˛> ?
)
˛˛? @
)
˛˛@ A
images
˛˛B H
.
˛˛H I
Add
˛˛I L
(
˛˛L M
base64Image
˛˛M X
)
˛˛X Y
;
˛˛Y Z
}
ˇˇ 
}
ÄÄ 
return
ÇÇ 
images
ÇÇ 
;
ÇÇ 
}
ÉÉ 	
private
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
List
ÖÖ 
<
ÖÖ  
string
ÖÖ  &
>
ÖÖ& '
>
ÖÖ' ()
GetBase64ImagesProductAsync
ÖÖ) D
(
ÖÖD E
string
ÖÖE K
	productId
ÖÖL U
,
ÖÖU V
bool
ÖÖW [
isGetAllImage
ÖÖ\ i
=
ÖÖj k
false
ÖÖl q
)
ÖÖq r
{
ÜÜ 	
try
áá 
{
àà 
var
ää 
cachedKeyImages
ää #
=
ää$ %'
GetKeyCachedProductImages
ää& ?
(
ää? @
	productId
ää@ I
)
ääI J
;
ääJ K
var
ãã 
pathDbImages
ãã  
=
ãã! "
await
ãã# (
_cached
ãã) 0
.
ãã0 1
GetAsync
ãã1 9
<
ãã9 :
List
ãã: >
<
ãã> ?
string
ãã? E
>
ããE F
>
ããF G
(
ããG H
cachedKeyImages
ããH W
)
ããW X
;
ããX Y
var
åå 
idImages
åå 
=
åå 
new
åå "
List
åå# '
<
åå' (
string
åå( .
>
åå. /
(
åå/ 0
)
åå0 1
;
åå1 2
if
èè 
(
èè 
pathDbImages
èè  
==
èè! #
null
èè$ (
||
èè) +
pathDbImages
èè, 8
.
èè8 9
CountExt
èè9 A
(
èèA B
)
èèB C
<=
èèD F
$num
èèG H
)
èèH I
{
êê 
var
ëë 
images
ëë 
=
ëë  
await
ëë! &
	_imageUoW
ëë' 0
.
ëë0 1
Images
ëë1 7
.
ëë7 8
GetAllAsync
ëë8 C
(
ëëC D
x
ëëD E
=>
ëëF H
x
ëëI J
.
ëëJ K

product_id
ëëK U
==
ëëV X
	productId
ëëY b
)
ëëb c
;
ëëc d
if
íí 
(
íí 
images
íí 
!=
íí !
null
íí" &
&&
íí' )
images
íí* 0
.
íí0 1
CountExt
íí1 9
(
íí9 :
)
íí: ;
>
íí< =
$num
íí> ?
)
íí? @
{
ìì 
pathDbImages
îî $
=
îî% &
images
îî' -
.
îî- .
	SelectExt
îî. 7
(
îî7 8
x
îî8 9
=>
îî: <
x
îî= >
.
îî> ?
path
îî? C
)
îîC D
.
îîD E
ToList
îîE K
(
îîK L
)
îîL M
;
îîM N
idImages
ïï  
=
ïï! "
images
ïï# )
.
ïï) *
	SelectExt
ïï* 3
(
ïï3 4
x
ïï4 5
=>
ïï6 8
x
ïï9 :
.
ïï: ;
id
ïï; =
)
ïï= >
.
ïï> ?
ToList
ïï? E
(
ïïE F
)
ïïF G
;
ïïG H
}
ññ 
}
óó 
if
ôô 
(
ôô 
pathDbImages
ôô  
==
ôô! #
null
ôô$ (
||
ôô) +
pathDbImages
ôô, 8
.
ôô8 9
Count
ôô9 >
(
ôô> ?
)
ôô? @
<=
ôôA C
$num
ôôD E
)
ôôE F
return
ôôG M
new
ôôN Q
List
ôôR V
<
ôôV W
string
ôôW ]
>
ôô] ^
(
ôô^ _
)
ôô_ `
;
ôô` a
var
úú 

timeCached
úú 
=
úú  
$num
úú! #
*
úú$ %
$num
úú& (
*
úú) *
$num
úú+ -
;
úú- .
await
ùù 
_cached
ùù 
.
ùù 
SetAsync
ùù &
(
ùù& '
cachedKeyImages
ùù' 6
,
ùù6 7
pathDbImages
ùù8 D
,
ùùD E

timeCached
ùùF P
)
ùùP Q
;
ùùQ R
var
üü 
base64Images
üü  
=
üü! "
new
üü# &
List
üü' +
<
üü+ ,
string
üü, 2
>
üü2 3
(
üü3 4
)
üü4 5
;
üü5 6
if
°° 
(
°° 
isGetAllImage
°° !
)
°°! "
{
¢¢ 
foreach
§§ 
(
§§ 
var
§§  
path
§§! %
in
§§& (
pathDbImages
§§) 5
)
§§5 6
{
•• 
var
¶¶ 
	byteImage
¶¶ %
=
¶¶& '
await
¶¶( -
_storageClient
¶¶. <
.
¶¶< =
DownloadFileAsync
¶¶= N
(
¶¶N O
path
¶¶O S
)
¶¶S T
;
¶¶T U
if
ßß 
(
ßß 
	byteImage
ßß %
!=
ßß& (
null
ßß) -
&&
ßß. 0
	byteImage
ßß1 :
.
ßß: ;
Length
ßß; A
>
ßßB C
$num
ßßD E
)
ßßE F
{
®® 
var
©© 
base64Image
©©  +
=
©©, -
Convert
©©. 5
.
©©5 6
ToBase64String
©©6 D
(
©©D E
	byteImage
©©E N
)
©©N O
;
©©O P
base64Image
™™ '
=
™™( )
$"
™™* ,
$str
™™, C
{
™™C D
base64Image
™™D O
}
™™O P
"
™™P Q
;
™™Q R
if
´´ 
(
´´  
!
´´  !
base64Image
´´! ,
.
´´, -'
IsNullOrEmptyOrWhiteSpace
´´- F
(
´´F G
)
´´G H
)
´´H I
{
¨¨ 
base64Images
≠≠  ,
.
≠≠, -
Add
≠≠- 0
(
≠≠0 1
base64Image
≠≠1 <
)
≠≠< =
;
≠≠= >
var
ÆÆ  #
pathProductLocal
ÆÆ$ 4
=
ÆÆ5 6
$"
ÆÆ7 9
{
ÆÆ9 :
FileExtensions
ÆÆ: H
.
ÆÆH I!
GetPathProductLocal
ÆÆI \
(
ÆÆ\ ]
)
ÆÆ] ^
}
ÆÆ^ _
$str
ÆÆ_ a
{
ÆÆa b
	productId
ÆÆb k
}
ÆÆk l
"
ÆÆl m
;
ÆÆm n
if
ØØ  "
(
ØØ# $
!
ØØ$ %
FileExtensions
ØØ% 3
.
ØØ3 4
CheckFolderExist
ØØ4 D
(
ØØD E
pathProductLocal
ØØE U
)
ØØU V
)
ØØV W
{
∞∞  !
FileExtensions
±±$ 2
.
±±2 3
CreateFolder
±±3 ?
(
±±? @
pathProductLocal
±±@ P
)
±±P Q
;
±±Q R
}
≤≤  !
System
¥¥  &
.
¥¥& '
IO
¥¥' )
.
¥¥) *
File
¥¥* .
.
¥¥. /
WriteAllBytes
¥¥/ <
(
¥¥< =
$"
¥¥= ?
{
¥¥? @
pathProductLocal
¥¥@ P
}
¥¥P Q
$str
¥¥Q S
{
¥¥S T
FileExtensions
¥¥T b
.
¥¥b c&
GetFileNameByPathProduct
¥¥c {
(
¥¥{ |
path¥¥| Ä
)¥¥Ä Å
}¥¥Å Ç
$str¥¥Ç á
"¥¥á à
,¥¥à â
	byteImage¥¥ä ì
)¥¥ì î
;¥¥î ï
}
µµ 
}
∂∂ 
}
∑∑ 
}
∏∏ 
else
ππ 
{
∫∫ 
var
ºº 
random
ºº 
=
ºº  
new
ºº! $
Random
ºº% +
(
ºº+ ,
)
ºº, -
;
ºº- .
int
ΩΩ 
imageRandom
ΩΩ #
=
ΩΩ$ %
random
ΩΩ& ,
.
ΩΩ, -
Next
ΩΩ- 1
(
ΩΩ1 2
pathDbImages
ΩΩ2 >
.
ΩΩ> ?
CountExt
ΩΩ? G
(
ΩΩG H
)
ΩΩH I
)
ΩΩI J
;
ΩΩJ K
var
ææ 
	byteImage
ææ !
=
ææ" #
await
ææ$ )
_storageClient
ææ* 8
.
ææ8 9
DownloadFileAsync
ææ9 J
(
ææJ K
pathDbImages
ææK W
[
ææW X
imageRandom
ææX c
]
ææc d
)
ææd e
;
ææe f
if
øø 
(
øø 
	byteImage
øø !
!=
øø" $
null
øø% )
&&
øø* ,
	byteImage
øø- 6
.
øø6 7
Length
øø7 =
>
øø> ?
$num
øø@ A
)
øøA B
{
¿¿ 
var
¡¡ 
base64Image
¡¡ '
=
¡¡( )
Convert
¡¡* 1
.
¡¡1 2
ToBase64String
¡¡2 @
(
¡¡@ A
	byteImage
¡¡A J
)
¡¡J K
;
¡¡K L
base64Image
¬¬ #
=
¬¬$ %
$"
¬¬& (
$str
¬¬( ?
{
¬¬? @
base64Image
¬¬@ K
}
¬¬K L
"
¬¬L M
;
¬¬M N
if
√√ 
(
√√ 
!
√√ 
base64Image
√√ (
.
√√( )'
IsNullOrEmptyOrWhiteSpace
√√) B
(
√√B C
)
√√C D
)
√√D E
{
ƒƒ 
base64Images
≈≈ (
.
≈≈( )
Add
≈≈) ,
(
≈≈, -
base64Image
≈≈- 8
)
≈≈8 9
;
≈≈9 :
var
∆∆ 
pathProductLocal
∆∆  0
=
∆∆1 2
$"
∆∆3 5
{
∆∆5 6
FileExtensions
∆∆6 D
.
∆∆D E!
GetPathProductLocal
∆∆E X
(
∆∆X Y
)
∆∆Y Z
}
∆∆Z [
$str
∆∆[ ]
{
∆∆] ^
	productId
∆∆^ g
}
∆∆g h
"
∆∆h i
;
∆∆i j
if
«« 
(
««  
!
««  !
FileExtensions
««! /
.
««/ 0
CheckFolderExist
««0 @
(
««@ A
pathProductLocal
««A Q
)
««Q R
)
««R S
{
»» 
FileExtensions
……  .
.
……. /
CreateFolder
……/ ;
(
……; <
pathProductLocal
……< L
)
……L M
;
……M N
}
   
System
ÃÃ "
.
ÃÃ" #
IO
ÃÃ# %
.
ÃÃ% &
File
ÃÃ& *
.
ÃÃ* +
WriteAllBytes
ÃÃ+ 8
(
ÃÃ8 9
$"
ÃÃ9 ;
{
ÃÃ; <
pathProductLocal
ÃÃ< L
}
ÃÃL M
$str
ÃÃM O
{
ÃÃO P
FileExtensions
ÃÃP ^
.
ÃÃ^ _&
GetFileNameByPathProduct
ÃÃ_ w
(
ÃÃw x
pathDbImagesÃÃx Ñ
[ÃÃÑ Ö
imageRandomÃÃÖ ê
]ÃÃê ë
)ÃÃë í
}ÃÃí ì
$strÃÃì ò
"ÃÃò ô
,ÃÃô ö
	byteImageÃÃõ §
)ÃÃ§ •
;ÃÃ• ¶
}
ÕÕ 
}
ŒŒ 
}
œœ 
return
–– 
base64Images
–– #
;
––# $
}
—— 
catch
““ 
(
““ 
	Exception
““ 
ex
““ 
)
““  
{
”” 
return
‘‘ 
new
‘‘ 
List
‘‘ 
<
‘‘  
string
‘‘  &
>
‘‘& '
(
‘‘' (
)
‘‘( )
;
‘‘) *
}
’’ 
}
÷÷ 	
private
◊◊ 
string
◊◊ '
GetKeyCachedProductImages
◊◊ 0
(
◊◊0 1
string
◊◊1 7
	productId
◊◊8 A
)
◊◊A B
=>
◊◊C E
$"
◊◊F H
$str
◊◊H W
{
◊◊W X
	productId
◊◊X a
}
◊◊a b
"
◊◊b c
;
◊◊c d
private
ŸŸ 
string
ŸŸ -
GetKeyCachedProductImagesBase64
ŸŸ 6
(
ŸŸ6 7
string
ŸŸ7 =
	productId
ŸŸ> G
)
ŸŸG H
=>
ŸŸI K
$"
ŸŸL N
$str
ŸŸN b
{
ŸŸb c
	productId
ŸŸc l
}
ŸŸl m
"
ŸŸm n
;
ŸŸn o
}
‹‹ 
}›› Ù
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Shipment\ShipmentService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 
ShipmentService

  
:

! "
BaseDomainService

# 4
<

4 5
ShipmentService

5 D
>

D E
,

E F
IShipmentService

G W
{ 
public 
ShipmentService 
( 
IServiceProvider /
serviceProvider0 ?
)? @
:@ A
baseA E
(E F
serviceProviderF U
)U V
{ 	
} 	
} 
} ±K
rC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\AddressInfoService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
AddressInfoService #
:$ %
BaseDomainService& 7
<7 8
AddressInfoService8 J
>J K
,K L
IAddressInfoServiceM `
{ 
private 
const 
string 
TAG  
=! "
$str# 7
;7 8
	protected 
readonly 
IAddressInfoUoW *
_addressInfoUoW+ :
;: ;
public 
AddressInfoService !
(! "
IServiceProvider" 2
serviceProvider3 B
)B C
:D E
baseF J
(J K
serviceProviderK Z
)Z [
{ 	
_addressInfoUoW 
= 
serviceProvider -
.- .
GetRequiredService. @
<@ A
IAddressInfoUoWA P
>P Q
(Q R
)R S
;S T
} 	
public 
async 
Task 
< 
bool 
> 
DeleteAddressInfo  1
(1 2
string2 8
id9 ;
); <
{ 	
try 
{ 
var 
	resDelete 
= 
await  %
_addressInfoUoW& 5
.5 6
AddressInfos6 B
.B C
DeleteOneAsyncC Q
(Q R
idR T
)T U
;U V
return 
	resDelete  
;  !
}   
catch!! 
(!! 
	Exception!! 
ex!! 
)!!  
{"" 
return## 
false## 
;## 
}$$ 
}%% 	
public'' 
async'' 
Task'' 
<'' 
AddressInfo'' %
>''% &
GetAddressInfo''' 5
(''5 6
string''6 <
id''= ?
)''? @
{(( 	
try)) 
{** 
var++ 
addressInfo++ 
=++  !
await++" '
_addressInfoUoW++( 7
.++7 8
AddressInfos++8 D
.++D E
GetByIdAsync++E Q
(++Q R
id++R T
)++T U
;++U V
return,, 
addressInfo,, "
;,," #
}-- 
catch.. 
(.. 
	Exception.. 
ex.. 
)..  
{// 
return00 
null00 
;00 
}11 
}22 	
public44 
async44 
Task44 
<44 
AddressInfo44 %
>44% &!
GetAddressInfoDefault44' <
(44< =
string44= C
userId44D J
)44J K
{55 	
try66 
{77 
var88 
addressInfo88 
=88  !
await88" '
_addressInfoUoW88( 7
.887 8
AddressInfos888 D
.88D E
GetOneAsync88E P
(88P Q
x88Q R
=>88S U
x88V W
.88W X
user_id88X _
==88` b
userId88c i
&&88j l
x88m n
.88n o

is_default88o y
)88y z
;88z {
return99 
addressInfo99 "
;99" #
}:: 
catch;; 
(;; 
	Exception;; 
ex;; 
);;  
{<< 
return== 
null== 
;== 
}>> 
}?? 	
publicAA 
asyncAA 
TaskAA 
<AA 
ListAA 
<AA 
AddressInfoAA *
>AA* +
>AA+ ,
GetAddressInfosAA- <
(AA< =
stringAA= C
userIdAAD J
)AAJ K
{BB 	
tryCC 
{DD 
varEE 
addressInfosEE  
=EE! "
awaitEE# (
_addressInfoUoWEE) 8
.EE8 9
AddressInfosEE9 E
.EEE F
GetAllAsyncEEF Q
(EEQ R
xEER S
=>EET V
xEEW X
.EEX Y
user_idEEY `
==EEa c
userIdEEd j
)EEj k
;EEk l
ifFF 
(FF 
addressInfosFF  
.FF  !
CountExtFF! )
(FF) *
)FF* +
<=FF, .
$numFF/ 0
)FF0 1
returnFF2 8
newFF9 <
ListFF= A
<FFA B
AddressInfoFFB M
>FFM N
(FFN O
)FFO P
;FFP Q
returnGG 
addressInfosGG #
.GG# $
ToListGG$ *
(GG* +
)GG+ ,
;GG, -
}HH 
catchII 
(II 
	ExceptionII 
exII 
)II  
{JJ 
returnKK 
nullKK 
;KK 
}LL 
}NN 	
publicPP 
asyncPP 
TaskPP 
<PP 
boolPP 
>PP 
InsertAddressInfoPP  1
(PP1 2
AddressInfoPP2 =
addressInfoPP> I
)PPI J
{QQ 	
tryRR 
{SS 
varTT 
	resInsertTT 
=TT 
awaitTT  %
_addressInfoUoWTT& 5
.TT5 6
AddressInfosTT6 B
.TTB C
InsertOneAsyncTTC Q
(TTQ R
addressInfoTTR ]
)TT] ^
;TT^ _
returnUU 
	resInsertUU  
!=UU! #
nullUU$ (
;UU( )
}VV 
catchWW 
(WW 
	ExceptionWW 
exWW 
)WW  
{XX 
returnYY 
falseYY 
;YY 
}ZZ 
}[[ 	
public]] 
async]] 
Task]] 
<]] 
bool]] 
>]] 
SetDefaultAddress]]  1
(]]1 2
string]]2 8
userId]]9 ?
,]]? @
string]]A G
id]]H J
,]]J K
bool]]L P
	isDefault]]Q Z
)]]Z [
{^^ 	
try__ 
{`` 
ifbb 
(bb 
	isDefaultbb 
)bb 
{cc 
vardd 
addressInfodd #
=dd$ %
awaitdd& +
_addressInfoUoWdd, ;
.dd; <
AddressInfosdd< H
.ddH I
GetOneAsyncddI T
(ddT U
xddU V
=>ddW Y
xddZ [
.dd[ \
user_iddd\ c
==ddd f
userIdddg m
&&ddn p
xddq r
.ddr s
iddds u
==ddv x
idddy {
)dd{ |
;dd| }
ifee 
(ee 
addressInfoee #
==ee$ &
nullee' +
)ee+ ,
returnee- 3
falseee4 9
;ee9 :
addressInfoff 
.ff  

is_defaultff  *
=ff+ ,
falseff- 2
;ff2 3
awaitgg 
_addressInfoUoWgg )
.gg) *
AddressInfosgg* 6
.gg6 7
UpdateOneAsyncgg7 E
(ggE F
addressInfoggF Q
)ggQ R
;ggR S
returnhh 
truehh 
;hh  
}ii 
varkk 
addressInfoskk  
=kk! "
awaitkk# (
_addressInfoUoWkk) 8
.kk8 9
AddressInfoskk9 E
.kkE F
GetAllAsynckkF Q
(kkQ R
xkkR S
=>kkT V
xkkW X
.kkX Y
user_idkkY `
==kka c
userIdkkd j
)kkj k
;kkk l
ifll 
(ll 
addressInfosll  
.ll  !
CountExtll! )
(ll) *
)ll* +
<=ll, .
$numll/ 0
)ll0 1
returnll2 8
falsell9 >
;ll> ?
foreachmm 
(mm 
varmm 
addressInfomm (
inmm) +
addressInfosmm, 8
)mm8 9
{nn 
ifoo 
(oo 
addressInfooo #
.oo# $
idoo$ &
==oo' )
idoo* ,
)oo, -
addressInfooo. 9
.oo9 :

is_defaultoo: D
=ooE F
trueooG K
;ooK L
elsepp 
addressInfopp $
.pp$ %

is_defaultpp% /
=pp0 1
falsepp2 7
;pp7 8
}qq 
awaitrr 
_addressInfoUoWrr %
.rr% &
AddressInfosrr& 2
.rr2 3
UpdateManyAsyncrr3 B
(rrB C
addressInfosrrC O
)rrO P
;rrP Q
returnss 
truess 
;ss 
}tt 
catchuu 
(uu 
	Exceptionuu 
exuu 
)uu  
{vv 
returnww 
falseww 
;ww 
}xx 
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
bool{{ 
>{{ 
UpdateAddressInfo{{  1
({{1 2
AddressInfo{{2 =
addressInfo{{> I
){{I J
{|| 	
try}} 
{~~ 
var 
	resUpdate 
= 
await  %
_addressInfoUoW& 5
.5 6
AddressInfos6 B
.B C
UpdateOneAsyncC Q
(Q R
addressInfoR ]
)] ^
;^ _
return
ÄÄ 
	resUpdate
ÄÄ  
;
ÄÄ  !
}
ÅÅ 
catch
ÇÇ 
(
ÇÇ 
	Exception
ÇÇ 
ex
ÇÇ 
)
ÇÇ  
{
ÉÉ 
return
ÑÑ 
false
ÑÑ 
;
ÑÑ 
}
ÖÖ 
}
ÜÜ 	
}
ää 
}ãã û
wC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\PermissionDetailService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 #
PermissionDetailService

 (
:

) *
BaseDomainService

+ <
<

< =#
PermissionDetailService

= T
>

T U
,

U V$
IPermissionDetailService

W o
{ 
public #
PermissionDetailService &
(& '
IServiceProvider' 7
serviceProvider8 G
)G H
:I J
baseK O
(O P
serviceProviderP _
)_ `
{ 	
} 	
} 
} Ω
}C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\PermissionRelationshipService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 )
PermissionRelationshipService

 .
:

/ 0
BaseDomainService

1 B
<

B C)
PermissionRelationshipService

C `
>

` a
,

a b+
IPermissionRelationshipService	

c Å
{ 
public )
PermissionRelationshipService ,
(, -
IServiceProvider- =
serviceProvider> M
)M N
:O P
baseQ U
(U V
serviceProviderV e
)e f
{ 	
} 	
} 
} Ä
qC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\PermissionService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 
PermissionService

 "
:

# $
BaseDomainService

% 6
<

6 7
PermissionService

7 H
>

H I
,

I J
IPermissionService

K ]
{ 
public 
PermissionService  
(  !
IServiceProvider! 1
serviceProvider2 A
)A B
:C D
baseE I
(I J
serviceProviderJ Y
)Y Z
{ 	
} 	
} 
} ¶
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\RoleService.cs
	namespace

 	
Web


 
.

 
AppCore

 
.

 
Services

 
{ 
public 

class 
RoleAccessService "
:# $
BaseDomainService% 6
<6 7
RoleAccessService7 H
>H I
,I J
IRoleAccessServiceK ]
{ 
	protected 
readonly 
IUserService '
_userService( 4
;4 5
public 
RoleAccessService  
(  !
IServiceProvider! 1
serviceProvider2 A
)A B
:C D
baseE I
(I J
serviceProviderJ Y
)Y Z
{ 	
} 	
public 
async 
Task 
< 
bool 
> 
IsAdminRoleAsync  0
(0 1
string1 7
userId8 >
,> ?
string@ F
subcriberIdG R
)R S
{ 	
await 
Task 
. 
CompletedTask $
;$ %
var!! 
	cachedKey!! 
=!! 

CachedKeys!! &
.!!& '!
GetKeyRoleAccessAdmin!!' <
(!!< =
userId!!= C
,!!C D
subcriberId!!D O
)!!O P
;!!P Q
bool"" 
isAdmin"" 
="" 
false""  
;""  !
if## 
(## 
string## 
.## 
IsNullOrEmpty## $
(##$ %
	cachedKey##% .
)##. /
)##/ 0
{$$ 
isAdmin'' 
='' 
false'' 
;''  
}(( 
else)) 
{** 
var++ 
user++ 
=++ 
await++  
_userService++! -
.++- .
GetUserByIdAsync++. >
(++> ?
userId++? E
)++E F
;++F G
if,, 
(,, 
user,, 
!=,, 
null,, 
),,  !
{-- 
isAdmin.. 
=.. 
true.. "
;.." #
}// 
else00 
{11 
isAdmin22 
=22 
false22 #
;22# $
}33 
}77 
return88 
isAdmin88 
;88 
}99 	
};; 
}<< ªJ
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Subcribers\UserService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{ 
public 

class 
UserService 
: 
BaseDomainService 0
<0 1
UserService1 <
>< =
,= >
IUserService? K
{ 
private 
const 
string 
TAG  
=! "
$str# 0
;0 1
	protected 
readonly 
IUserUoW #
_userUoW$ ,
;, -
public 
UserService 
( 
IServiceProvider +
serviceProvider, ;
); <
:= >
base? C
(C D
serviceProviderD S
)S T
{ 	
_userUoW 
= 
serviceProvider &
.& '
GetRequiredService' 9
<9 :
IUserUoW: B
>B C
(C D
)D E
;E F
} 	
public'' 
async'' 
Task'' 
<'' 
User'' 
>'' 
GetUserByIdAsync''  0
(''0 1
string''1 7
id''8 :
)'': ;
{(( 	
var)) 
user)) 
=)) 
await)) 
_userUoW)) %
.))% &
Users))& +
.))+ ,
GetByIdAsync)), 8
())8 9
id))9 ;
))); <
;))< =
return** 
user** 
;** 
}++ 	
public-- 
async-- 
Task-- 
<-- 
IEnumerable-- %
<--% &
User--& *
>--* +
>--+ ,
GetUsersAsync--- :
(--: ;
)--; <
{.. 	
var// 
users// 
=// 
await// 
_userUoW// &
.//& '
Users//' ,
.//, -
GetAllAsync//- 8
(//8 9
)//9 :
;//: ;
return00 
users00 
;00 
}11 	
public33 
async33 
Task33 
<33 
bool33 
>33 
InsertUserAsync33  /
(33/ 0
User330 4
user335 9
)339 :
{44 	
try55 
{66 
var77 

userInsert77 
=77  
await77! &
_userUoW77' /
.77/ 0
Users770 5
.775 6
InsertOneAsync776 D
(77D E
user77E I
)77I J
;77J K
return88 
true88 
;88 
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
_logger<< 
.<< 
LogError<<  
(<<  !
$"<<! #
{<<# $
TAG<<$ '
}<<' (
$str<<( N
{<<N O
ex<<O Q
.<<Q R
Message<<R Y
}<<Y Z
"<<Z [
)<<[ \
;<<\ ]
return== 
false== 
;== 
}>> 
}?? 	
publicFF 
asyncFF 
TaskFF 
<FF 
boolFF 
>FF 
DeleteUserAsyncFF  /
(FF/ 0
stringFF0 6
userIdFF7 =
)FF= >
{GG 	
tryHH 
{II 
varJJ 
userJJ 
=JJ 
awaitJJ  
_userUoWJJ! )
.JJ) *
UsersJJ* /
.JJ/ 0
GetByIdAsyncJJ0 <
(JJ< =
userIdJJ= C
)JJC D
;JJD E
awaitKK 
_userUoWKK 
.KK 
UsersKK $
.KK$ %
DeleteOneAsyncKK% 3
(KK3 4
userKK4 8
)KK8 9
;KK9 :
returnLL 
trueLL 
;LL 
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
_loggerPP 
.PP 
LogErrorPP  
(PP  !
$"PP! #
{PP# $
TAGPP$ '
}PP' (
$strPP( N
{PPN O
exPPO Q
.PPQ R
MessagePPR Y
}PPY Z
"PPZ [
)PP[ \
;PP\ ]
returnQQ 
falseQQ 
;QQ 
}RR 
}SS 	
publicUU 
asyncUU 
TaskUU 
<UU 
boolUU 
>UU 
DeleteUserAsyncUU  /
(UU/ 0
ListUU0 4
<UU4 5
stringUU5 ;
>UU; <
userIdsUU= D
)UUD E
{VV 	
tryWW 
{XX 
varYY 
usersYY 
=YY 
awaitYY !
_userUoWYY" *
.YY* +
UsersYY+ 0
.YY0 1
GetByIdsAsyncYY1 >
(YY> ?
userIdsYY? F
)YYF G
;YYG H
awaitZZ 
_userUoWZZ 
.ZZ 
UsersZZ $
.ZZ$ %
DeleteManyAsyncZZ% 4
(ZZ4 5
usersZZ5 :
)ZZ: ;
;ZZ; <
return[[ 
true[[ 
;[[ 
}\\ 
catch]] 
(]] 
	Exception]] 
ex]] 
)]]  
{^^ 
_logger__ 
.__ 
LogError__  
(__  !
$"__! #
{__# $
TAG__$ '
}__' (
$str__( N
{__N O
ex__O Q
.__Q R
Message__R Y
}__Y Z
$str__Z f
{__f g
	JsonUtils__g p
.__p q
	Serialize__q z
(__z {
userIds	__{ Ç
)
__Ç É
}
__É Ñ
"
__Ñ Ö
)
__Ö Ü
;
__Ü á
return`` 
false`` 
;`` 
}aa 
}bb 	
publicdd 
asyncdd 
Taskdd 
<dd 
booldd 
>dd 
UpdateUserAsyncdd  /
(dd/ 0
Userdd0 4
userdd5 9
)dd9 :
{ee 	
returnff 
awaitff 
_userUoWff !
.ff! "
Usersff" '
.ff' (
UpdateOneAsyncff( 6
(ff6 7
userff7 ;
)ff; <
;ff< =
}gg 	
publicnn 
asyncnn 
Tasknn 
<nn 
boolnn 
>nn "
UpdateInfoAddressAsyncnn  6
(nn6 7
Usernn7 ;
usernn< @
)nn@ A
{oo 	
varpp 
userDbpp 
=pp 
awaitpp 
_userUoWpp '
.pp' (
Userspp( -
.pp- .
GetOneAsyncpp. 9
(pp9 :
xpp: ;
=>pp< >
xpp? @
.pp@ A
	user_nameppA J
==ppK M
userppN R
.ppR S
	user_nameppS \
)pp\ ]
;pp] ^
ifqq 
(qq 
userDbqq 
==qq 
nullqq 
)qq 
returnqq  &
falseqq' ,
;qq, -
returnxx 
awaitxx 
_userUoWxx !
.xx! "
Usersxx" '
.xx' (
UpdateOneAsyncxx( 6
(xx6 7
userDbxx7 =
)xx= >
;xx> ?
}yy 	
public{{ 
async{{ 
Task{{ 
<{{ 
Pagging{{ !
<{{! "
User{{" &
>{{& '
>{{' (
GetUserPageAsync{{) 9
({{9 :

Pagination{{: D

pagination{{E O
){{O P
{|| 	
if}} 
(}} 

pagination}} 
.}} 
Filter}} !
.}}! "%
IsNullOrEmptyOrWhiteSpace}}" ;
(}}; <
)}}< =
)}}= >
{~~ 
return 
await 
_userUoW %
.% &
Users& +
.+ ,
GetPaggingAsync, ;
(; <

pagination< F
)F G
;G H
}
ÄÄ 
return
ÅÅ 
await
ÅÅ 
_userUoW
ÅÅ !
.
ÅÅ! "
Users
ÅÅ" '
.
ÅÅ' (
GetPaggingAsync
ÅÅ( 7
(
ÅÅ7 8

pagination
ÅÅ8 B
,
ÅÅB C
x
ÇÇ< =
=>
ÇÇ> @
x
ÇÇA B
.
ÇÇB C
	user_name
ÇÇC L
.
ÇÇL M
ContainsText
ÇÇM Y
(
ÇÇY Z

pagination
ÇÇZ d
.
ÇÇd e
Filter
ÇÇe k
)
ÇÇk l
)
ÇÇl m
;
ÇÇm n
}
ÉÉ 	
public
ÖÖ 
async
ÖÖ 
Task
ÖÖ 
<
ÖÖ 
User
ÖÖ 
>
ÖÖ $
GetUserByUserNameAsync
ÖÖ  6
(
ÖÖ6 7
string
ÖÖ7 =
userName
ÖÖ> F
)
ÖÖF G
{
ÜÜ 	
var
áá 
users
áá 
=
áá 
await
áá 
_userUoW
áá &
.
áá& '
Users
áá' ,
.
áá, -
GetAllAsync
áá- 8
(
áá8 9
x
áá9 :
=>
áá; =
x
áá> ?
.
áá? @
	user_name
áá@ I
.
ááI J
Equals
ááJ P
(
ááP Q
userName
ááQ Y
)
ááY Z
)
ááZ [
;
áá[ \
if
àà 
(
àà 
users
àà 
.
àà 
CountExt
àà 
(
àà 
)
àà  
<=
àà! #
$num
àà$ %
)
àà% &
return
àà' -
null
àà. 2
;
àà2 3
return
ââ 
users
ââ 
.
ââ 
FirstOrDefault
ââ '
(
ââ' (
)
ââ( )
;
ââ) *
}
ää 	
}
åå 
}çç Ù
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Services\Supplier\SupplierService.cs
	namespace 	
Web
 
. 
AppCore 
. 
Services 
{		 
public

 

class

 
SupplierService

  
:

! "
BaseDomainService

# 4
<

4 5
SupplierService

5 D
>

D E
,

E F
ISupplierService

G W
{ 
public 
SupplierService 
( 
IServiceProvider /
serviceProvider0 ?
)? @
:@ A
baseA E
(E F
serviceProviderF U
)U V
{ 	
} 	
} 
} ô
^C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Ultility\DQLibrary.cs
	namespace 	
Web
 
. 
AppCore 
. 
Ultility 
{		 
public

 

static

 
class

 
	DQLibrary

 !
{ 
public 
static 
string 
GetDataFileAsync -
(- .
this. 2
string3 9
pathFile: B
)B C
{ 	
try 
{ 
if 
( 
! 
string 
. 
IsNullOrEmpty )
() *
pathFile* 2
)2 3
&&4 6
File7 ;
.; <
Exists< B
(B C
pathFileC K
)K L
)L M
{ 
var 
byteFile  
=! "
File# '
.' (
ReadAllBytes( 4
(4 5
pathFile5 =
)= >
;> ?
if 
( 
byteFile  
==! #
null$ (
)( )
{ 
return 
$str !
;! "
} 
return 
Convert "
." #
ToBase64String# 1
(1 2
byteFile2 :
): ;
;; <
} 
return 
$str 
; 
} 
catch 
( 
	Exception 
) 
{ 
return 
$str 
; 
} 
}   	
public!! 
static!! 
bool!! 
CompareResult!! (
(!!( )
this!!) -
string!!. 4
result!!5 ;
,!!; <
string!!= C
option!!D J
)!!J K
{"" 	
if## 
(## 
string## 
.## 
IsNullOrEmpty## $
(##$ %
result##% +
)##+ ,
||##- /
string##0 6
.##6 7
IsNullOrEmpty##7 D
(##D E
option##E K
)##K L
)##L M
return##N T
false##U Z
;##Z [
if$$ 
($$ 
result$$ 
.$$ 
Trim$$ 
($$ 
)$$ 
==$$  
option$$! '
.$$' (
Trim$$( ,
($$, -
)$$- .
)$$. /
return$$0 6
true$$7 ;
;$$; <
return%% 
false%% 
;%% 
}&& 	
}'' 
}(( π
`C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Ultility\JsonMapping.cs
	namespace 	
Web
 
. 
AppCore 
. 
Ultility 
{		 
public

 

static

 
class

 
JsonMapping

 #
{ 
public 
static 
T 
? 
ConvertData $
<$ %
T% &
>& '
(' (
this( ,
T- .
data/ 3
,3 4
object5 ;
data2< A
)A B
{ 	
return 
JsonConvert 
. 
DeserializeObject 0
<0 1
T1 2
>2 3
(3 4
JsonConvert4 ?
.? @
SerializeObject@ O
(O P
data2P U
)U V
)V W
;W X
} 	
} 
} 