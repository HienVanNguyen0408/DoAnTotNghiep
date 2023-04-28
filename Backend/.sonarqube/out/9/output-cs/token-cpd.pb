�
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
}## �
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
} �
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
} �
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
}$$ �
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
} �
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
} �
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
} �
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
} �
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
} �
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
}-- �	
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
}"" �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
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
} �
�C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IPermissionDetailUoW.cs
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
} �
�C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Repository\Subcribers\IPermissionRelationshipUoW.cs
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
} �
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
} �
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
} �
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
} �
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
}hh �
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
}66 �
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
} �
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
} �
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
} �	
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
} �	
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
} �
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
} �
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
} �
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
}GG �
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
}ii �
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
} �
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
} �
�C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IPermissionDetailService.cs
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
 �
�C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.AppCore\Interfaces\Services\Subcribers\IPermissionRelationshipService.cs
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
 �
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
 �
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
} �
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
}@@ �
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
} �

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
} �
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
} �.
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
}44 �
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
}!! ΃
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

pagination	^^| �
)
^^� �
;
^^� �
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

pagination	__x �
.
__� �
Filter
__� �
)
__� �
)
__� �
;
__� �
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
�� 
await
�� 
_blogCategoryUoW
�� )
.
��) *
BlogCategories
��* 8
.
��8 9
UpdateOneAsync
��9 G
(
��G H
blogCategory
��H T
)
��T U
;
��U V
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
BlogRespone
�� %
>
��% &
GetBlogAsync
��' 3
(
��3 4
string
��4 :
blogId
��; A
)
��A B
{
�� 	
var
�� 
blogRespone
�� 
=
�� 
new
�� !
BlogRespone
��" -
(
��- .
)
��. /
;
��/ 0
var
�� 
blog
�� 
=
�� 
await
�� 
_blogUoW
�� %
.
��% &
Blogs
��& +
.
��+ ,
GetByIdAsync
��, 8
(
��8 9
blogId
��9 ?
)
��? @
;
��@ A
if
�� 
(
�� 
blog
�� 
==
�� 
null
�� 
)
�� 
return
�� $
null
��% )
;
��) *
blogRespone
�� 
=
�� 
MapperExtensions
�� *
.
��* +

MapperData
��+ 5
<
��5 6
Blog
��6 :
,
��: ;
BlogRespone
��< G
>
��G H
(
��H I
blog
��I M
)
��M N
;
��N O
var
�� 

pathImages
�� 
=
�� 
await
�� "&
GetBase64ImagesBlogAsync
��# ;
(
��; <
blogId
��< B
,
��B C
true
��D H
)
��H I
;
��I J
if
�� 
(
�� 

pathImages
�� 
!=
�� 
null
�� "
&&
��# %

pathImages
��& 0
.
��0 1
CountExt
��1 9
(
��9 :
)
��: ;
>
��< =
$num
��> ?
)
��? @
{
�� 
blogRespone
�� 
.
�� 
files
�� !
=
��" #

pathImages
��$ .
.
��. /
	SelectExt
��/ 8
(
��8 9
x
��9 :
=>
��; =
new
��> A
FileInfo
��B J
{
��K L
path
��M Q
=
��R S
x
��T U
}
��V W
)
��W X
.
��X Y
ToList
��Y _
(
��_ `
)
��` a
;
��a b
}
�� 
return
�� 
blogRespone
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
IEnumerable
�� %
<
��% &
Blog
��& *
>
��* +
>
��+ ,
GetBlogsAsync
��- :
(
��: ;
)
��; <
{
�� 	
return
�� 
await
�� 
_blogUoW
�� !
.
��! "
Blogs
��" '
.
��' (
GetAllAsync
��( 3
(
��3 4
)
��4 5
;
��5 6
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Pagging
�� !
<
��! "
BlogRespone
��" -
>
��- .
>
��. /"
GetBlogsPaggingAsync
��0 D
(
��D E

Pagination
��E O

pagination
��P Z
)
��Z [
{
�� 	
var
�� 

pageResult
�� 
=
�� 
new
��  
Pagging
��! (
<
��( )
BlogRespone
��) 4
>
��4 5
(
��5 6
)
��6 7
;
��7 8
try
�� 
{
�� 
var
�� 
blogPage
�� 
=
�� 
new
�� "
Pagging
��# *
<
��* +
Blog
��+ /
>
��/ 0
(
��0 1
)
��1 2
;
��2 3
if
�� 
(
�� 

pagination
�� 
.
�� 
Filter
�� %
.
��% &'
IsNullOrEmptyOrWhiteSpace
��& ?
(
��? @
)
��@ A
)
��A B
{
�� 
blogPage
�� 
=
�� 
await
�� $
_blogUoW
��% -
.
��- .
Blogs
��. 3
.
��3 4
GetPaggingAsync
��4 C
(
��C D

pagination
��D N
)
��N O
;
��O P
}
�� 
else
�� 
{
�� 
blogPage
�� 
=
�� 
await
�� $
_blogUoW
��% -
.
��- .
Blogs
��. 3
.
��3 4
GetPaggingAsync
��4 C
(
��C D

pagination
��D N
,
��N O
x
��P Q
=>
��R T
x
��U V
.
��V W
title
��W \
.
��\ ]
ContainsText
��] i
(
��i j

pagination
��j t
.
��t u
Filter
��u {
)
��{ |
)
��| }
;
��} ~
}
�� 
if
�� 
(
�� 
blogPage
�� 
!=
�� 
null
��  $
)
��$ %
{
�� 

pageResult
�� 
=
��  
new
��! $
Pagging
��% ,
<
��, -
BlogRespone
��- 8
>
��8 9
{
�� 
Data
�� 
=
�� 
blogPage
�� '
.
��' (
Data
��( ,
!=
��- /
null
��0 4
?
��5 6
blogPage
��7 ?
.
��? @
Data
��@ D
.
��D E
Select
��E K
(
��K L
blog
��L P
=>
��Q S
MapperExtensions
��T d
.
��d e

MapperData
��e o
<
��o p
Blog
��p t
,
��t u
BlogRespone��v �
>��� �
(��� �
blog��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
,��� �
	PageIndex
�� !
=
��" #
blogPage
��$ ,
.
��, -
	PageIndex
��- 6
,
��6 7
PageSize
��  
=
��! "
blogPage
��# +
.
��+ ,
PageSize
��, 4
,
��4 5

TotalPages
�� "
=
��# $
blogPage
��% -
.
��- .

TotalPages
��. 8
,
��8 9
TotalRecord
�� #
=
��$ %
blogPage
��& .
.
��. /
TotalRecord
��/ :
}
�� 
;
�� 
if
�� 
(
�� 

pageResult
�� "
.
��" #
Data
��# '
!=
��( *
null
��+ /
&&
��0 2

pageResult
��3 =
.
��= >
Data
��> B
.
��B C
CountExt
��C K
(
��K L
)
��L M
>
��N O
$num
��P Q
)
��Q R
{
�� 
var
�� 
blogs
�� !
=
��" #

pageResult
��$ .
.
��. /
Data
��/ 3
;
��3 4
for
�� 
(
�� 
int
��  
index
��! &
=
��' (
$num
��) *
;
��* +
index
��, 1
<
��2 3

pageResult
��4 >
.
��> ?
Data
��? C
.
��C D
CountExt
��D L
(
��L M
)
��M N
;
��N O
index
��P U
++
��U W
)
��W X
{
�� 
var
�� 
blog
��  $
=
��% &

pageResult
��' 1
.
��1 2
Data
��2 6
[
��6 7
index
��7 <
]
��< =
;
��= >
if
�� 
(
��  
blog
��  $
.
��$ %
files
��% *
==
��+ -
null
��. 2
)
��2 3
blog
��4 8
.
��8 9
files
��9 >
=
��? @
new
��A D
List
��E I
<
��I J
FileInfo
��J R
>
��R S
(
��S T
)
��T U
;
��U V
var
�� 
base64Images
��  ,
=
��- .
await
��/ 4&
GetBase64ImagesBlogAsync
��5 M
(
��M N
blog
��N R
.
��R S
id
��S U
)
��U V
;
��V W
if
�� 
(
��  
base64Images
��  ,
!=
��- /
null
��0 4
&&
��5 7
base64Images
��8 D
.
��D E
CountExt
��E M
(
��M N
)
��N O
>
��P Q
$num
��R S
)
��S T
{
�� 
blog
��  $
.
��$ %
files
��% *
=
��+ ,
base64Images
��- 9
.
��9 :
	SelectExt
��: C
(
��C D
x
��D E
=>
��F H
new
��I L
FileInfo
��M U
{
��V W
path
��X \
=
��] ^
x
��_ `
}
��a b
)
��b c
.
��c d
ToList
��d j
(
��j k
)
��k l
;
��l m
}
�� 

pageResult
�� &
.
��& '
Data
��' +
[
��+ ,
index
��, 1
]
��1 2
.
��2 3
files
��3 8
=
��9 :
blog
��; ?
.
��? @
files
��@ E
;
��E F
}
�� 
}
�� 
}
�� 
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
�� 
}
�� 
return
�� 

pageResult
�� 
;
�� 
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
�� 
InsertBlogAsync
��  /
(
��/ 0
BlogRequest
��0 ;
request
��< C
)
��C D
{
�� 	
try
�� 
{
�� 
var
�� 
blog
�� 
=
�� 
(
�� 
Blog
��  
)
��  !
request
��! (
;
��( )
var
�� 

blogInsert
�� 
=
��  
await
��! &
_blogUoW
��' /
.
��/ 0
Blogs
��0 5
.
��5 6
InsertOneAsync
��6 D
(
��D E
blog
��E I
)
��I J
;
��J K
if
�� 
(
�� 

blogInsert
�� 
!=
�� !
null
��" &
)
��& '
{
�� 
if
�� 
(
�� 
request
�� 
.
��  
files
��  %
!=
��& (
null
��) -
&&
��. 0
request
��1 8
.
��8 9
files
��9 >
.
��> ?
CountExt
��? G
(
��G H
)
��H I
>
��J K
$num
��L M
)
��M N
{
�� 
await
�� 
InsertImagesAsync
�� /
(
��/ 0
request
��0 7
.
��7 8
files
��8 =
,
��= >
request
��? F
.
��F G
id
��G I
)
��I J
;
��J K
}
�� 
}
�� 
return
�� 

blogInsert
�� !
!=
��" $
null
��% )
;
��) *
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
�� 
UpdateBlogAsync
��  /
(
��/ 0
BlogRequest
��0 ;
blogRequest
��< G
)
��G H
{
�� 	
var
�� 
blog
�� 
=
�� 
MapperExtensions
�� '
.
��' (

MapperData
��( 2
<
��2 3
BlogRequest
��3 >
,
��> ?
Blog
��@ D
>
��D E
(
��E F
blogRequest
��F Q
)
��Q R
;
��R S
var
�� 

blogUpdate
�� 
=
�� 
await
�� "
_blogUoW
��# +
.
��+ ,
Blogs
��, 1
.
��1 2
UpdateOneAsync
��2 @
(
��@ A
blog
��A E
)
��E F
;
��F G
if
�� 
(
�� 
!
�� 

blogUpdate
�� 
)
�� 
return
�� #
false
��$ )
;
��) *
if
�� 
(
�� 
blogRequest
�� 
.
�� 
files
�� !
==
��" $
null
��% )
||
��* ,
blogRequest
��- 8
.
��8 9
files
��9 >
.
��> ?
CountExt
��? G
(
��G H
)
��H I
<=
��J L
$num
��M N
)
��N O
return
��P V

blogUpdate
��W a
;
��a b
var
�� 
files
�� 
=
�� 
blogRequest
�� #
.
��# $
files
��$ )
.
��) *
Where
��* /
(
��/ 0
x
��0 1
=>
��2 4
!
��5 6
x
��6 7
.
��7 8
path
��8 <
.
��< ='
IsNullOrEmptyOrWhiteSpace
��= V
(
��V W
)
��W X
)
��X Y
.
��Y Z
ToList
��Z `
(
��` a
)
��a b
;
��b c
var
�� 
images
�� 
=
�� 
await
�� 
	_imageUoW
�� (
.
��( )
Images
��) /
.
��/ 0
GetAllAsync
��0 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
blog_id
��C J
==
��K M
blogRequest
��N Y
.
��Y Z
id
��Z \
)
��\ ]
;
��] ^
if
�� 
(
�� 
images
�� 
.
�� 
CountExt
�� 
(
��  
)
��  !
>
��" #
$num
��$ %
)
��% &
{
�� 
var
�� 
deleteImages
��  
=
��! "
await
��# (#
DeleteImagesBlogAsync
��) >
(
��> ?
blogRequest
��? J
.
��J K
id
��K M
,
��M N
images
��O U
.
��U V
	SelectExt
��V _
(
��_ `
x
��` a
=>
��b d
x
��e f
.
��f g
path
��g k
)
��k l
.
��l m
ToList
��m s
(
��s t
)
��t u
)
��u v
;
��v w
if
�� 
(
�� 
deleteImages
��  
)
��  !
{
�� 
await
�� 
InsertImagesAsync
�� +
(
��+ ,
blogRequest
��, 7
.
��7 8
files
��8 =
,
��= >
blogRequest
��? J
.
��J K
id
��K M
)
��M N
;
��N O
}
�� 
}
�� 
else
�� 
{
�� 
await
�� 
InsertImagesAsync
�� '
(
��' (
blogRequest
��( 3
.
��3 4
files
��4 9
,
��9 :
blogRequest
��; F
.
��F G
id
��G I
)
��I J
;
��J K
}
�� 
return
�� 

blogUpdate
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
DeleteBlogAsync
��  /
(
��/ 0
Blog
��0 4
blog
��5 9
)
��9 :
{
�� 	
var
�� 
images
�� 
=
�� 
await
�� 
	_imageUoW
�� (
.
��( )
Images
��) /
.
��/ 0
GetAllAsync
��0 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C
blog_id
��C J
==
��K M
blog
��N R
.
��R S
id
��S U
)
��U V
;
��V W
if
�� 
(
�� 
images
�� 
.
�� 
CountExt
�� 
(
��  
)
��  !
>
��" #
$num
��$ %
)
��% &
{
�� 
await
�� #
DeleteImagesBlogAsync
�� +
(
��+ ,
blog
��, 0
.
��0 1
id
��1 3
,
��3 4
images
��5 ;
.
��; <
	SelectExt
��< E
(
��E F
x
��F G
=>
��H J
x
��K L
.
��L M
path
��M Q
)
��Q R
.
��R S
ToList
��S Y
(
��Y Z
)
��Z [
)
��[ \
;
��\ ]
}
�� 
return
�� 
await
�� 
_blogUoW
�� !
.
��! "
Blogs
��" '
.
��' (
DeleteOneAsync
��( 6
(
��6 7
blog
��7 ;
)
��; <
;
��< =
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
�� 
DeleteBlogsAsync
��  0
(
��0 1
List
��1 5
<
��5 6
Blog
��6 :
>
��: ;
blogs
��< A
)
��A B
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
blogs
�� 
.
�� 
CountExt
�� "
(
��" #
)
��# $
<=
��% '
$num
��( )
)
��) *
return
��+ 1
false
��2 7
;
��7 8
foreach
�� 
(
�� 
var
�� 
blog
�� !
in
��" $
blogs
��% *
)
��* +
{
�� 
var
�� 
images
�� 
=
��  
await
��! &
	_imageUoW
��' 0
.
��0 1
Images
��1 7
.
��7 8
GetAllAsync
��8 C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
blog_id
��K R
==
��S U
blog
��V Z
.
��Z [
id
��[ ]
)
��] ^
;
��^ _
if
�� 
(
�� 
images
�� 
.
�� 
CountExt
�� '
(
��' (
)
��( )
>
��* +
$num
��, -
)
��- .
{
�� 
await
�� #
DeleteImagesBlogAsync
�� 3
(
��3 4
blog
��4 8
.
��8 9
id
��9 ;
,
��; <
images
��= C
.
��C D
	SelectExt
��D M
(
��M N
x
��N O
=>
��P R
x
��S T
.
��T U
path
��U Y
)
��Y Z
.
��Z [
ToList
��[ a
(
��a b
)
��b c
)
��c d
;
��d e
}
�� 
}
�� 
return
�� 
await
�� 
_blogUoW
�� %
.
��% &
Blogs
��& +
.
��+ ,
DeleteManyAsync
��, ;
(
��; <
blogs
��< A
)
��A B
;
��B C
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
string
��  &
>
��& '
>
��' ($
GetPathImagesBlogAsync
��) ?
(
��? @
string
��@ F
blogId
��G M
)
��M N
{
�� 	
try
�� 
{
�� 
var
�� 
cachedKeyImages
�� #
=
��$ %$
GetKeyCachedBlogImages
��& <
(
��< =
blogId
��= C
)
��C D
;
��D E
var
�� 
pathDbImages
��  
=
��! "
await
��# (
_cached
��) 0
.
��0 1
GetAsync
��1 9
<
��9 :
List
��: >
<
��> ?
string
��? E
>
��E F
>
��F G
(
��G H
cachedKeyImages
��H W
)
��W X
;
��X Y
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
CountExt
��9 A
(
��A B
)
��B C
<=
��D F
$num
��G H
)
��H I
{
�� 
var
�� 
images
�� 
=
��  
await
��! &
	_imageUoW
��' 0
.
��0 1
Images
��1 7
.
��7 8
GetAllAsync
��8 C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
blog_id
��K R
==
��S U
blogId
��V \
)
��\ ]
;
��] ^
if
�� 
(
�� 
images
�� 
!=
�� !
null
��" &
&&
��' )
images
��* 0
.
��0 1
CountExt
��1 9
(
��9 :
)
��: ;
>
��< =
$num
��> ?
)
��? @
{
�� 
pathDbImages
�� $
=
��% &
images
��' -
.
��- .
	SelectExt
��. 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
path
��? C
)
��C D
.
��D E
ToList
��E K
(
��K L
)
��L M
;
��M N
}
�� 
}
�� 
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
Count
��9 >
(
��> ?
)
��? @
<=
��A C
$num
��D E
)
��E F
return
��G M
new
��N Q
List
��R V
<
��V W
string
��W ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
var
�� 

timeCached
�� 
=
��  
$num
��! #
*
��$ %
$num
��& (
*
��) *
$num
��+ -
;
��- .
await
�� 
_cached
�� 
.
�� 
SetAsync
�� &
(
��& '
cachedKeyImages
��' 6
,
��6 7
pathDbImages
��8 D
,
��D E

timeCached
��F P
)
��P Q
;
��Q R
var
�� 
paths
�� 
=
�� 
new
�� 
List
��  $
<
��$ %
string
��% +
>
��+ ,
(
��, -
)
��- .
;
��. /
foreach
�� 
(
�� 
var
�� 
path
�� !
in
��" $
pathDbImages
��% 1
)
��1 2
{
�� 
var
�� 
keyPathStorage
�� &
=
��' (
$"
��) +
{
��+ ,
path
��, 0
}
��0 1
"
��1 2
;
��2 3
var
�� 
pathStorage
�� #
=
��$ %
await
��& +
_cached
��, 3
.
��3 4
GetAsync
��4 <
<
��< =
string
��= C
>
��C D
(
��D E
keyPathStorage
��E S
)
��S T
;
��T U
if
�� 
(
�� 
!
�� 
pathStorage
�� $
.
��$ %'
IsNullOrEmptyOrWhiteSpace
��% >
(
��> ?
)
��? @
)
��@ A
{
�� 
paths
�� 
.
�� 
Add
�� !
(
��! "
pathStorage
��" -
)
��- .
;
��. /
}
�� 
else
�� 
{
�� 
pathStorage
�� #
=
��$ %
await
��& +
_storageClient
��, :
.
��: ;&
GetPathFileDownloadAsync
��; S
(
��S T
path
��T X
,
��X Y

timeCached
��Z d
)
��d e
;
��e f
if
�� 
(
�� 
!
�� 
pathStorage
�� (
.
��( )'
IsNullOrEmptyOrWhiteSpace
��) B
(
��B C
)
��C D
)
��D E
paths
��F K
.
��K L
Add
��L O
(
��O P
pathStorage
��P [
)
��[ \
;
��\ ]
await
�� 
_cached
�� %
.
��% &
SetAsync
��& .
(
��. /
keyPathStorage
��/ =
,
��= >
pathStorage
��? J
,
��J K

timeCached
��L V
)
��V W
;
��W X
}
�� 
}
�� 
return
�� 
paths
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
List
�� 
<
��  
string
��  &
>
��& '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
string
��  &
>
��& '
>
��' (&
GetBase64ImagesBlogAsync
��) A
(
��A B
string
��B H
blogId
��I O
,
��O P
bool
��Q U
isGetAllImage
��V c
=
��d e
false
��f k
)
��k l
{
�� 	
try
�� 
{
�� 
var
�� 
cachedKeyImages
�� #
=
��$ %$
GetKeyCachedBlogImages
��& <
(
��< =
blogId
��= C
)
��C D
;
��D E
var
�� 
pathDbImages
��  
=
��! "
await
��# (
_cached
��) 0
.
��0 1
GetAsync
��1 9
<
��9 :
List
��: >
<
��> ?
string
��? E
>
��E F
>
��F G
(
��G H
cachedKeyImages
��H W
)
��W X
;
��X Y
var
�� 
idImages
�� 
=
�� 
new
�� "
List
��# '
<
��' (
string
��( .
>
��. /
(
��/ 0
)
��0 1
;
��1 2
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
CountExt
��9 A
(
��A B
)
��B C
<=
��D F
$num
��G H
)
��H I
{
�� 
var
�� 
images
�� 
=
��  
await
��! &
	_imageUoW
��' 0
.
��0 1
Images
��1 7
.
��7 8
GetAllAsync
��8 C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K
blog_id
��K R
==
��S U
blogId
��V \
)
��\ ]
;
��] ^
if
�� 
(
�� 
images
�� 
!=
�� !
null
��" &
&&
��' )
images
��* 0
.
��0 1
CountExt
��1 9
(
��9 :
)
��: ;
>
��< =
$num
��> ?
)
��? @
{
�� 
pathDbImages
�� $
=
��% &
images
��' -
.
��- .
	SelectExt
��. 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
path
��? C
)
��C D
.
��D E
ToList
��E K
(
��K L
)
��L M
;
��M N
idImages
��  
=
��! "
images
��# )
.
��) *
	SelectExt
��* 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
id
��; =
)
��= >
.
��> ?
ToList
��? E
(
��E F
)
��F G
;
��G H
}
�� 
}
�� 
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
Count
��9 >
(
��> ?
)
��? @
<=
��A C
$num
��D E
)
��E F
return
��G M
new
��N Q
List
��R V
<
��V W
string
��W ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
var
�� 

timeCached
�� 
=
��  
$num
��! #
*
��$ %
$num
��& (
*
��) *
$num
��+ -
;
��- .
await
�� 
_cached
�� 
.
�� 
SetAsync
�� &
(
��& '
cachedKeyImages
��' 6
,
��6 7
pathDbImages
��8 D
,
��D E

timeCached
��F P
)
��P Q
;
��Q R
var
�� 
base64Images
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
if
�� 
(
�� 
isGetAllImage
�� !
)
��! "
{
�� 
foreach
�� 
(
�� 
var
��  
path
��! %
in
��& (
pathDbImages
��) 5
)
��5 6
{
�� 
var
�� 
	byteImage
�� %
=
��& '
await
��( -
_storageClient
��. <
.
��< =
DownloadFileAsync
��= N
(
��N O
path
��O S
)
��S T
;
��T U
if
�� 
(
�� 
	byteImage
�� %
!=
��& (
null
��) -
&&
��. 0
	byteImage
��1 :
.
��: ;
Length
��; A
>
��B C
$num
��D E
)
��E F
{
�� 
var
�� 
base64Image
��  +
=
��, -
Convert
��. 5
.
��5 6
ToBase64String
��6 D
(
��D E
	byteImage
��E N
)
��N O
;
��O P
base64Image
�� '
=
��( )
$"
��* ,
$str
��, C
{
��C D
base64Image
��D O
}
��O P
"
��P Q
;
��Q R
if
�� 
(
��  
!
��  !
base64Image
��! ,
.
��, -'
IsNullOrEmptyOrWhiteSpace
��- F
(
��F G
)
��G H
)
��H I
base64Images
��J V
.
��V W
Add
��W Z
(
��Z [
base64Image
��[ f
)
��f g
;
��g h
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
random
�� 
=
��  
new
��! $
Random
��% +
(
��+ ,
)
��, -
;
��- .
int
�� 
imageRandom
�� #
=
��$ %
random
��& ,
.
��, -
Next
��- 1
(
��1 2
pathDbImages
��2 >
.
��> ?
CountExt
��? G
(
��G H
)
��H I
)
��I J
;
��J K
var
�� 
	byteImage
�� !
=
��" #
await
��$ )
_storageClient
��* 8
.
��8 9
DownloadFileAsync
��9 J
(
��J K
pathDbImages
��K W
[
��W X
imageRandom
��X c
]
��c d
)
��d e
;
��e f
if
�� 
(
�� 
	byteImage
�� !
!=
��" $
null
��% )
&&
��* ,
	byteImage
��- 6
.
��6 7
Length
��7 =
>
��> ?
$num
��@ A
)
��A B
{
�� 
var
�� 
base64Image
�� '
=
��( )
Convert
��* 1
.
��1 2
ToBase64String
��2 @
(
��@ A
	byteImage
��A J
)
��J K
;
��K L
base64Image
�� #
=
��$ %
$"
��& (
$str
��( ?
{
��? @
base64Image
��@ K
}
��K L
"
��L M
;
��M N
if
�� 
(
�� 
!
�� 
base64Image
�� (
.
��( )'
IsNullOrEmptyOrWhiteSpace
��) B
(
��B C
)
��C D
)
��D E
base64Images
��F R
.
��R S
Add
��S V
(
��V W
base64Image
��W b
)
��b c
;
��c d
}
�� 
}
�� 
return
�� 
base64Images
�� #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
List
�� 
<
��  
string
��  &
>
��& '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
string
��  &
>
��& '
>
��' ('
GetPathImagesByPathsAsync
��) B
(
��B C
List
��C G
<
��G H
string
��H N
>
��N O
paths
��P U
)
��U V
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
paths
�� 
==
�� 
null
�� !
||
��" $
paths
��% *
.
��* +
CountExt
��+ 3
(
��3 4
)
��4 5
<=
��6 8
$num
��9 :
)
��: ;
return
��< B
new
��C F
List
��G K
<
��K L
string
��L R
>
��R S
(
��S T
)
��T U
;
��U V
var
�� 
pathsStorage
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
foreach
�� 
(
�� 
var
�� 
path
�� !
in
��" $
paths
��% *
)
��* +
{
�� 
var
�� 

timeCached
�� "
=
��# $
$num
��% '
*
��( )
$num
��* ,
*
��- .
$num
��/ 1
;
��1 2
var
�� 
pathStorage
�� #
=
��$ %
await
��& +
_storageClient
��, :
.
��: ;&
GetPathFileDownloadAsync
��; S
(
��S T
path
��T X
,
��X Y

timeCached
��Z d
)
��d e
;
��e f
if
�� 
(
�� 
!
�� 
pathStorage
�� $
.
��$ %'
IsNullOrEmptyOrWhiteSpace
��% >
(
��> ?
)
��? @
)
��@ A
pathsStorage
��B N
.
��N O
Add
��O R
(
��R S
pathStorage
��S ^
)
��^ _
;
��_ `
}
�� 
return
�� 
pathsStorage
�� #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
List
�� 
<
��  
string
��  &
>
��& '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
InsertImagesAsync
��! 2
(
��2 3
List
��3 7
<
��7 8
FileInfo
��8 @
>
��@ A
	fileInfos
��B K
,
��K L
string
��M S
blogId
��T Z
)
��Z [
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
	fileInfos
�� 
.
�� 
CountExt
�� &
(
��& '
)
��' (
<=
��) +
$num
��, -
)
��- .
return
��/ 5
false
��6 ;
;
��; <
var
�� 
imagesInsert
��  
=
��! "
	fileInfos
��# ,
.
��, -
Select
��- 3
(
��3 4
(
��4 5
x
��5 6
,
��6 7
index
��8 =
)
��= >
=>
��? A
new
��B E
Image
��F K
(
��K L
)
��L M
{
�� 
path
�� 
=
�� 
GlobalConstant
�� )
.
��) *
GetFullPathBlog
��* 9
(
��9 :
$"
��: <
{
��< =
blogId
��= C
}
��C D
$str
��D E
{
��E F
Guid
��F J
.
��J K
NewGuid
��K R
(
��R S
)
��S T
}
��T U
"
��U V
,
��V W
FileExtensions
��X f
.
��f g
GetFileExtention
��g w
(
��w x
FileType��x �
.��� �
Image��� �
)��� �
)��� �
,��� �
blog_id
�� 
=
�� 
blogId
�� $
,
��$ %
	is_picked
�� 
=
�� 
true
��  $
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
var
�� 
insertImage
�� 
=
��  !
await
��" '
	_imageUoW
��( 1
.
��1 2
Images
��2 8
.
��8 9
InsertManyAsync
��9 H
(
��H I
imagesInsert
��I U
)
��U V
;
��V W
if
�� 
(
�� 
insertImage
�� 
.
��  
CountExt
��  (
(
��( )
)
��) *
>
��+ ,
$num
��- .
)
��. /
{
�� 
for
�� 
(
�� 
int
�� 
index
�� "
=
��# $
$num
��% &
;
��& '
index
��( -
<
��. /
	fileInfos
��0 9
.
��9 :
CountExt
��: B
(
��B C
)
��C D
;
��D E
index
��F K
++
��K M
)
��M N
{
�� 
var
�� 
byteFile
�� $
=
��% &
ConvertExtensions
��' 8
.
��8 9
ConvertFromBase64
��9 J
(
��J K
	fileInfos
��K T
[
��T U
index
��U Z
]
��Z [
.
��[ \
path
��\ `
)
��` a
;
��a b
var
�� 
insertStorage
�� )
=
��* +
await
��, 1
_storageClient
��2 @
.
��@ A
UploadFileAsync
��A P
(
��P Q
imagesInsert
��Q ]
[
��] ^
index
��^ c
]
��c d
.
��d e
path
��e i
,
��i j
byteFile
��k s
)
��s t
;
��t u
if
�� 
(
�� 
insertStorage
�� )
)
��) *
{
�� 
var
�� 
keyPathStorage
��  .
=
��/ 0$
GetKeyCachedBlogImages
��1 G
(
��G H
blogId
��H N
)
��N O
;
��O P
await
�� !
_cached
��" )
.
��) *
SetAsync
��* 2
(
��2 3
keyPathStorage
��3 A
,
��A B
insertImage
��C N
.
��N O
	SelectExt
��O X
(
��X Y
x
��Y Z
=>
��[ ]
x
��^ _
.
��_ `
path
��` d
)
��d e
.
��e f
ToList
��f l
(
��l m
)
��m n
,
��n o
$num
��p r
*
��s t
$num
��u w
*
��x y
$num
��z |
)
��| }
;
��} ~
}
�� 
}
�� 
return
�� 
true
�� 
;
��  
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  #
DeleteImagesBlogAsync
��! 6
(
��6 7
string
��7 =
blogId
��> D
,
��D E
List
��F J
<
��J K
string
��K Q
>
��Q R
paths
��S X
)
��X Y
{
�� 	
try
�� 
{
�� 
var
�� 
deleteImages
��  
=
��! "
await
��# (
	_imageUoW
��) 2
.
��2 3
Images
��3 9
.
��9 :
DeleteManyAsync
��: I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q
blog_id
��Q X
==
��Y [
blogId
��\ b
)
��b c
;
��c d
if
�� 
(
�� 
deleteImages
��  
)
��  !
{
�� 
var
�� 
	keyCached
�� !
=
��" #$
GetKeyCachedBlogImages
��$ :
(
��: ;
blogId
��; A
)
��A B
;
��B C
await
�� 
_cached
�� !
.
��! "
RemoveAsync
��" -
(
��- .
	keyCached
��. 7
)
��7 8
;
��8 9
if
�� 
(
�� 
paths
�� 
.
�� 
CountExt
�� &
(
��& '
)
��' (
>
��) *
$num
��+ ,
)
��, -
{
�� 
foreach
�� 
(
��  !
var
��! $
path
��% )
in
��* ,
paths
��- 2
)
��2 3
{
�� 
await
�� !
_storageClient
��" 0
.
��0 1$
DeleteFileStorageAsync
��1 G
(
��G H
path
��H L
)
��L M
;
��M N
}
�� 
}
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
string
�� $
GetKeyCachedBlogImages
�� -
(
��- .
string
��. 4
blogId
��5 ;
)
��; <
=>
��= ?
$"
��@ B
$str
��B N
{
��N O
blogId
��O U
}
��U V
"
��V W
;
��W X
private
�� 
string
�� *
GetKeyCachedBlogImagesBase64
�� 3
(
��3 4
string
��4 :
blogId
��; A
)
��A B
=>
��C E
GlobalConstant
��F T
.
��T U
GetFullPathBlog
��U d
(
��d e
$"
��e g
{
��g h
blogId
��h n
}
��n o
$str
��o p
{
��p q
Guid
��q u
.
��u v
NewGuid
��v }
(
��} ~
)
��~ 
}�� �
"��� �
,��� �
FileExtensions��� �
.��� � 
GetFileExtention��� �
(��� �
FileType��� �
.��� �
Image��� �
)��� �
)��� �
;��� �
}
�� 
}�� �
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
}&& �
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
} �
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
�� 
}�� �L
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
}FF �)
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
}kk �
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
Value	66~ �
)
66� �
;
66� �
}
66� �
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

Dictionary	{{z �
<
{{� �
string
{{� �
,
{{� �
string
{{� �
>
{{� �
headers
{{� �
=
{{� �
null
{{� �
,
{{� �

Dictionary
{{� �
<
{{� �
string
{{� �
,
{{� �
string
{{� �
>
{{� �
paramQueries
{{� �
=
{{� �
null
{{� �
,
{{� �
int
{{� �
timeOut
{{� �
=
{{� �
TIMEOUT
{{� �
)
{{� �
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
Encoding	}}x �
.
}}� �
UTF8
}}� �
,
}}� �
$str
}}� �
)
}}� �
,
}}� �
headers
}}� �
,
}}� �
paramQueries
}}� �
,
}}� �
timeOut
}}� �
)
}}� �
;
}}� �
}~~ 	
public
�� 
static
�� 
async
�� 
Task
��  
<
��  ! 
HttpClientResponse
��! 3
>
��3 4%
DoPostOrPutEncodedAsync
��5 L
(
��L M
string
��M S
url
��T W
,
��W X

HttpMethod
��Y c

httpMethod
��d n
,
��n o

Dictionary
��p z
<
��z {
string��{ �
,��� �
string��� �
>��� �
data��� �
,��� �

Dictionary��� �
<��� �
string��� �
,��� �
string��� �
>��� �
headers��� �
=��� �
null��� �
,��� �

Dictionary��� �
<��� �
string��� �
,��� �
string��� �
>��� �
paramQueries��� �
=��� �
null��� �
,��� �
int��� �
timeOut��� �
=��� �
TIMEOUT��� �
)��� �
{
�� 	
return
�� 
await
�� 
DoPostOrPutAsync
�� )
(
��) *
url
��* -
,
��- .

httpMethod
��/ 9
,
��9 :
new
��; >#
FormUrlEncodedContent
��? T
(
��T U
data
��U Y
)
��Y Z
,
��Z [
headers
��\ c
,
��c d
paramQueries
��e q
,
��q r
timeOut
��s z
)
��z {
;
��{ |
}
�� 	
public
�� 
static
�� 
async
�� 
Task
��  
<
��  ! 
HttpClientResponse
��! 3
>
��3 4
DoPostOrPutAsync
��5 E
(
��E F
string
��F L
url
��M P
,
��P Q

HttpMethod
��R \

httpMethod
��] g
,
��g h
HttpContent
��i t
httpContent��u �
,��� �

Dictionary��� �
<��� �
string��� �
,��� �
string��� �
>��� �
headers��� �
=��� �
null��� �
,��� �

Dictionary��� �
<��� �
string��� �
,��� �
string��� �
>��� �
paramQueries��� �
=��� �
null��� �
,��� �
int��� �
timeOut��� �
=��� �
TIMEOUT��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
new
��  
HttpClientResponse
�� /
(
��/ 0
)
��0 1
;
��1 2
try
�� 
{
�� 
var
�� 
cookieContainer
�� #
=
��$ %
new
��& )
CookieContainer
��* 9
(
��9 :
)
��: ;
;
��; <
using
�� 
var
�� 
client
��  
=
��! "
new
��# &

HttpClient
��' 1
(
��1 2#
GetHttpMessageHandler
��2 G
(
��G H
cookieContainer
��H W
)
��W X
)
��X Y
;
��Y Z
var
�� 
uri
�� 
=
�� 
await
�� 
GetUriAsync
��  +
(
��+ ,
url
��, /
,
��/ 0
paramQueries
��1 =
)
��= >
;
��> ?!
SetHeaderHttpClient
�� #
(
��# $
client
��$ *
,
��* +
headers
��, 3
)
��3 4
;
��4 5"
SetTimeoutHttpClient
�� $
(
��$ %
client
��% +
,
��+ ,
timeOut
��- 4
)
��4 5
;
��5 6
using
�� 
var
�� !
httpResponseMessage
�� -
=
��. /
await
��0 5
client
��6 <
.
��< =
	SendAsync
��= F
(
��F G
new
��G J 
HttpRequestMessage
��K ]
{
��^ _

RequestUri
��` j
=
��k l
uri
��m p
,
��p q
Method
��r x
=
��y z

httpMethod��{ �
,��� �
Content��� �
=��� �
httpContent��� �
}��� �
)��� �
;��� �
if
�� 
(
�� !
httpResponseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
)
��; <
{
�� 
result
�� 
.
�� 

ByteResult
�� %
=
��& '
await
��( -!
httpResponseMessage
��. A
.
��A B
Content
��B I
.
��I J"
ReadAsByteArrayAsync
��J ^
(
��^ _
)
��_ `
;
��` a
}
�� 
else
�� 
{
�� 
}
�� 
result
�� 
.
�� !
IsSuccessStatusCode
�� *
=
��+ ,!
httpResponseMessage
��- @
.
��@ A!
IsSuccessStatusCode
��A T
;
��T U
result
�� 
.
�� 

StatusCode
�� !
=
��" #!
httpResponseMessage
��$ 7
.
��7 8

StatusCode
��8 B
;
��B C
result
�� 
.
�� 
ReasonPhrase
�� #
=
��$ %!
httpResponseMessage
��& 9
.
��9 :
ReasonPhrase
��: F
;
��F G
result
�� 
.
�� 
Cookies
�� 
=
��  
cookieContainer
��! 0
.
��0 1

GetCookies
��1 ;
(
��; <
uri
��< ?
)
��? @
;
��@ A
result
�� 
.
�� 
Headers
�� 
=
��  !
httpResponseMessage
��! 4
.
��4 5
Headers
��5 <
;
��< =
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
result
�� 
.
�� 
	Exception
��  
=
��! "
ex
��# %
;
��% &
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
async
�� 
Task
��  
<
��  ! 
HttpClientResponse
��! 3
>
��3 4
GetAsync
��5 =
(
��= >
string
��> D
url
��E H
,
��H I

Dictionary
��J T
<
��T U
string
��U [
,
��[ \
string
��] c
>
��c d
paramQueries
��e q
=
��r s
null
��t x
,
��x y

Dictionary��z �
<��� �
string��� �
,��� �
string��� �
>��� �
headers��� �
=��� �
null��� �
,��� �
int��� �
timeOut��� �
=��� �
TIMEOUT��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
new
��  
HttpClientResponse
�� /
(
��/ 0
)
��0 1
;
��1 2
try
�� 
{
�� 
var
�� 
cookieContainer
�� #
=
��$ %
new
��& )
CookieContainer
��* 9
(
��9 :
)
��: ;
;
��; <
using
�� 
var
�� 
client
��  
=
��! "
new
��# &

HttpClient
��' 1
(
��1 2#
GetHttpMessageHandler
��2 G
(
��G H
cookieContainer
��H W
)
��W X
)
��X Y
;
��Y Z
var
�� 
uri
�� 
=
�� 
await
�� 
GetUriAsync
��  +
(
��+ ,
url
��, /
,
��/ 0
paramQueries
��1 =
)
��= >
;
��> ?!
SetHeaderHttpClient
�� #
(
��# $
client
��$ *
,
��* +
headers
��, 3
)
��3 4
;
��4 5"
SetTimeoutHttpClient
�� $
(
��$ %
client
��% +
,
��+ ,
timeOut
��- 4
)
��4 5
;
��5 6
using
�� 
var
�� !
httpResponseMessage
�� -
=
��. /
await
��0 5
client
��6 <
.
��< =
GetAsync
��= E
(
��E F
uri
��F I
)
��I J
;
��J K
if
�� 
(
�� !
httpResponseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
)
��; <
{
�� 
result
�� 
.
�� 

ByteResult
�� %
=
��& '
await
��( -!
httpResponseMessage
��. A
.
��A B
Content
��B I
.
��I J"
ReadAsByteArrayAsync
��J ^
(
��^ _
)
��_ `
;
��` a
}
�� 
else
�� 
{
�� 
}
�� 
result
�� 
.
�� !
IsSuccessStatusCode
�� *
=
��+ ,!
httpResponseMessage
��- @
.
��@ A!
IsSuccessStatusCode
��A T
;
��T U
result
�� 
.
�� 

StatusCode
�� !
=
��" #!
httpResponseMessage
��$ 7
.
��7 8

StatusCode
��8 B
;
��B C
result
�� 
.
�� 
ReasonPhrase
�� #
=
��$ %!
httpResponseMessage
��& 9
.
��9 :
ReasonPhrase
��: F
;
��F G
result
�� 
.
�� 
Cookies
�� 
=
��  
cookieContainer
��! 0
.
��0 1

GetCookies
��1 ;
(
��; <
uri
��< ?
)
��? @
;
��@ A
result
�� 
.
�� 
Headers
�� 
=
��  !
httpResponseMessage
��! 4
.
��4 5
Headers
��5 <
;
��< =
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
result
�� 
.
�� 
	Exception
��  
=
��! "
ex
��# %
;
��% &
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
public
�� 
static
�� 
async
�� 
Task
��  
<
��  ! 
HttpClientResponse
��! 3
>
��3 4
DeleteAsync
��5 @
(
��@ A
string
��A G
url
��H K
,
��K L

Dictionary
��M W
<
��W X
string
��X ^
,
��^ _
string
��` f
>
��f g
paramDeletes
��h t
=
��u v
null
��w {
,
��{ |

Dictionary��} �
<��� �
string��� �
,��� �
string��� �
>��� �
headers��� �
=��� �
null��� �
,��� �
int��� �
timeOut��� �
=��� �
TIMEOUT��� �
)��� �
{
�� 	
var
�� 
result
�� 
=
�� 
new
��  
HttpClientResponse
�� /
(
��/ 0
)
��0 1
;
��1 2
try
�� 
{
�� 
var
�� 
cookieContainer
�� #
=
��$ %
new
��& )
CookieContainer
��* 9
(
��9 :
)
��: ;
;
��; <
using
�� 
var
�� 
client
��  
=
��! "
new
��# &

HttpClient
��' 1
(
��1 2#
GetHttpMessageHandler
��2 G
(
��G H
cookieContainer
��H W
)
��W X
)
��X Y
;
��Y Z
var
�� 
uri
�� 
=
�� 
await
�� 
GetUriAsync
��  +
(
��+ ,
url
��, /
,
��/ 0
paramDeletes
��1 =
)
��= >
;
��> ?!
SetHeaderHttpClient
�� #
(
��# $
client
��$ *
,
��* +
headers
��, 3
)
��3 4
;
��4 5"
SetTimeoutHttpClient
�� $
(
��$ %
client
��% +
,
��+ ,
timeOut
��- 4
)
��4 5
;
��5 6
using
�� 
var
�� !
httpResponseMessage
�� -
=
��. /
await
��0 5
client
��6 <
.
��< =
DeleteAsync
��= H
(
��H I
uri
��I L
)
��L M
;
��M N
if
�� 
(
�� !
httpResponseMessage
�� '
.
��' (!
IsSuccessStatusCode
��( ;
)
��; <
{
�� 
result
�� 
.
�� 

ByteResult
�� %
=
��& '
await
��( -!
httpResponseMessage
��. A
.
��A B
Content
��B I
.
��I J"
ReadAsByteArrayAsync
��J ^
(
��^ _
)
��_ `
;
��` a
}
�� 
else
�� 
{
�� 
}
�� 
result
�� 
.
�� !
IsSuccessStatusCode
�� *
=
��+ ,!
httpResponseMessage
��- @
.
��@ A!
IsSuccessStatusCode
��A T
;
��T U
result
�� 
.
�� 

StatusCode
�� !
=
��" #!
httpResponseMessage
��$ 7
.
��7 8

StatusCode
��8 B
;
��B C
result
�� 
.
�� 
ReasonPhrase
�� #
=
��$ %!
httpResponseMessage
��& 9
.
��9 :
ReasonPhrase
��: F
;
��F G
result
�� 
.
�� 
Cookies
�� 
=
��  
cookieContainer
��! 0
.
��0 1

GetCookies
��1 ;
(
��; <
uri
��< ?
)
��? @
;
��@ A
result
�� 
.
�� 
Headers
�� 
=
��  !
httpResponseMessage
��! 4
.
��4 5
Headers
��5 <
;
��< =
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
result
�� 
.
�� 
	Exception
��  
=
��! "
ex
��# %
;
��% &
}
�� 
return
�� 
result
�� 
;
�� 
}
�� 	
}
�� 
}�� �$
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
}BB �
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
}:: �
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
} �
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
} �
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
} �P
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
�� 
await
�� 
	_orderUoW
�� "
.
��" #
Orders
��# )
.
��) *
UpdateOneAsync
��* 8
(
��8 9
order
��9 >
)
��> ?
;
��? @
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
�� 
UpdateOrderAsync
��  0
(
��0 1
)
��1 2
{
�� 	
return
�� 
await
�� 
_publisherQueue
�� (
.
��( )%
PublishUpdateOrderAsync
��) @
(
��@ A
$str
��A N
)
��N O
;
��O P
}
�� 	
public
�� 
Task
�� 
<
�� 
bool
�� 
>
�� %
UpdatePaymentOrderAsync
�� 1
(
��1 2
)
��2 3
{
�� 	
throw
�� 
new
�� %
NotImplementedException
�� -
(
��- .
)
��. /
;
��/ 0
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
�� %
UpdateOrderOnQueueAsync
��  7
(
��7 8
Order
��8 =
order
��> C
,
��C D
IDictionary
��E P
<
��P Q
string
��Q W
,
��W X
object
��Y _
>
��_ `
headers
��a h
)
��h i
{
�� 	
return
�� 
await
�� 
	_orderUoW
�� "
.
��" #
Orders
��# )
.
��) *
UpdateOneAsync
��* 8
(
��8 9
order
��9 >
)
��> ?
;
��? @
}
�� 	
}
�� 
}�� ��
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
GetPaggingAsync	ccr �
(
cc� �

pagination
cc� �
)
cc� �
;
cc� �
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

pagination	dd~ �
.
dd� �
Filter
dd� �
)
dd� �
)
dd� �
;
dd� �
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
�� (
UpdateProductCategoryAsync
��  :
(
��: ;
ProductCategory
��; J
productCategory
��K Z
)
��Z [
{
�� 	
return
�� 
await
�� !
_productCategoryUoW
�� ,
.
��, -
ProductCategories
��- >
.
��> ?
UpdateOneAsync
��? M
(
��M N
productCategory
��N ]
)
��] ^
;
��^ _
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
DeleteStatus
�� &
>
��& ' 
DeleteProductAsync
��( :
(
��: ;
Product
��; B
product
��C J
)
��J K
{
�� 	
try
�� 
{
�� 
var
�� 

orderItems
�� 
=
��  
await
��! &
_orderItemUoW
��' 4
.
��4 5

OrderItems
��5 ?
.
��? @
GetAllAsync
��@ K
(
��K L
x
��L M
=>
��N P
x
��Q R
.
��R S

product_id
��S ]
==
��^ `
product
��a h
.
��h i
id
��i k
)
��k l
;
��l m
if
�� 
(
�� 

orderItems
�� 
!=
�� !
null
��" &
&&
��' )

orderItems
��* 4
.
��4 5
Count
��5 :
(
��: ;
)
��; <
>
��= >
$num
��? @
)
��@ A
return
��B H
DeleteStatus
��I U
.
��U V
Incurred
��V ^
;
��^ _
var
�� 
images
�� 
=
�� 
await
�� "
	_imageUoW
��# ,
.
��, -
Images
��- 3
.
��3 4
GetAllAsync
��4 ?
(
��? @
x
��@ A
=>
��B D
x
��E F
.
��F G

product_id
��G Q
==
��R T
product
��U \
.
��\ ]
id
��] _
)
��_ `
;
��` a
if
�� 
(
�� 
images
�� 
.
�� 
CountExt
�� #
(
��# $
)
��$ %
>
��& '
$num
��( )
)
��) *
{
�� 
await
�� &
DeleteImagesProductAsync
�� 2
(
��2 3
product
��3 :
.
��: ;
id
��; =
,
��= >
images
��? E
.
��E F
	SelectExt
��F O
(
��O P
x
��P Q
=>
��R T
x
��U V
.
��V W
path
��W [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
)
��e f
;
��f g
}
�� 
await
�� 
	_imageUoW
�� 
.
��  
Images
��  &
.
��& '
DeleteManyAsync
��' 6
(
��6 7
x
��7 8
=>
��9 ;
x
��< =
.
��= >

product_id
��> H
==
��I K
product
��L S
.
��S T
id
��T V
)
��V W
;
��W X
var
�� 
	resDelete
�� 
=
�� 
await
��  %
_productUoW
��& 1
.
��1 2
Products
��2 :
.
��: ;
DeleteOneAsync
��; I
(
��I J
product
��J Q
)
��Q R
;
��R S
return
�� 
	resDelete
��  
?
��! "
DeleteStatus
��# /
.
��/ 0
Success
��0 7
:
��8 9
DeleteStatus
��: F
.
��F G
Fail
��G K
;
��K L
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
�� 
DeleteStatus
�� #
.
��# $
Fail
��$ (
;
��( )
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
�� 
DeleteStatus
�� &
>
��& '!
DeleteProductsAsync
��( ;
(
��; <
IEnumerable
��< G
<
��G H
Product
��H O
>
��O P
products
��Q Y
)
��Y Z
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
products
�� 
==
�� 
null
��  $
&&
��% '
products
��( 0
.
��0 1
Count
��1 6
(
��6 7
)
��7 8
<=
��9 ;
$num
��< =
)
��= >
return
��? E
DeleteStatus
��F R
.
��R S
None
��S W
;
��W X
var
�� 

orderItems
�� 
=
��  
await
��! &
_orderItemUoW
��' 4
.
��4 5

OrderItems
��5 ?
.
��? @
GetAllAsync
��@ K
(
��K L
x
��L M
=>
��N P
products
��Q Y
.
��Y Z
Any
��Z ]
(
��] ^
p
��^ _
=>
��` b
p
��c d
.
��d e
id
��e g
==
��h j
x
��k l
.
��l m

product_id
��m w
)
��w x
)
��x y
;
��y z
if
�� 
(
�� 

orderItems
�� 
!=
�� !
null
��" &
&&
��' )

orderItems
��* 4
.
��4 5
Count
��5 :
(
��: ;
)
��; <
>
��= >
$num
��? @
)
��@ A
return
��B H
DeleteStatus
��I U
.
��U V
Incurred
��V ^
;
��^ _
await
�� 
	_imageUoW
�� 
.
��  
Images
��  &
.
��& '
DeleteManyAsync
��' 6
(
��6 7
x
��7 8
=>
��9 ;
products
��< D
.
��D E
Any
��E H
(
��H I
p
��I J
=>
��K M
p
��N O
.
��O P
id
��P R
==
��S U
x
��V W
.
��W X

product_id
��X b
)
��b c
)
��c d
;
��d e
var
�� 
	resDelete
�� 
=
�� 
await
��  %
_productUoW
��& 1
.
��1 2
Products
��2 :
.
��: ;
DeleteManyAsync
��; J
(
��J K
products
��K S
)
��S T
;
��T U
return
�� 
	resDelete
��  
?
��! "
DeleteStatus
��# /
.
��/ 0
Success
��0 7
:
��8 9
DeleteStatus
��: F
.
��F G
Fail
��G K
;
��K L
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
�� 
DeleteStatus
�� #
.
��# $
Fail
��$ (
;
��( )
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
�� 
IEnumerable
�� %
<
��% &
Product
��& -
>
��- .
>
��. /
GetProductsAsync
��0 @
(
��@ A
)
��A B
{
�� 	
return
�� 
await
�� 
_productUoW
�� $
.
��$ %
Products
��% -
.
��- .
GetAllAsync
��. 9
(
��9 :
)
��: ;
;
��; <
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
Pagging
�� !
<
��! "
ProductRespone
��" 0
>
��0 1
>
��1 2%
GetProductsPaggingAsync
��3 J
(
��J K"
ProductFilterRequest
��K _
request
��` g
,
��g h
bool
��i m
isAdmin
��n u
)
��u v
{
�� 	
var
�� 

pageResult
�� 
=
�� 
new
��  
Pagging
��! (
<
��( )
ProductRespone
��) 7
>
��7 8
(
��8 9
)
��9 :
;
��: ;
try
�� 
{
�� 
var
�� 
productPage
�� 
=
��  !
await
��" '
_productUoW
��( 3
.
��3 4%
GetProductsPaggingAsync
��4 K
(
��K L
request
��L S
)
��S T
;
��T U
if
�� 
(
�� 
productPage
�� 
==
��  "
null
��# '
||
��( *
productPage
��+ 6
.
��6 7
Data
��7 ;
==
��< >
null
��? C
||
��D F
productPage
��G R
.
��R S
Data
��S W
.
��W X
CountExt
��X `
(
��` a
)
��a b
<=
��c e
$num
��f g
)
��g h
return
��i o

pageResult
��p z
;
��z {
if
�� 
(
�� 
productPage
�� 
!=
��  "
null
��# '
)
��' (
{
�� 

pageResult
�� 
=
��  
new
��! $
Pagging
��% ,
<
��, -
ProductRespone
��- ;
>
��; <
{
�� 
Data
�� 
=
�� 
productPage
�� *
.
��* +
Data
��+ /
!=
��0 2
null
��3 7
?
��8 9
productPage
��: E
.
��E F
Data
��F J
.
��J K
Select
��K Q
(
��Q R
product
��R Y
=>
��Z \
MapperExtensions
��] m
.
��m n

MapperData
��n x
<
��x y
Product��y �
,��� �
ProductRespone��� �
>��� �
(��� �
product��� �
)��� �
)��� �
.��� �
ToList��� �
(��� �
)��� �
:��� �
null��� �
,��� �
	PageIndex
�� !
=
��" #
productPage
��$ /
.
��/ 0
	PageIndex
��0 9
,
��9 :
PageSize
��  
=
��! "
productPage
��# .
.
��. /
PageSize
��/ 7
,
��7 8

TotalPages
�� "
=
��# $
productPage
��% 0
.
��0 1

TotalPages
��1 ;
,
��; <
TotalRecord
�� #
=
��$ %
productPage
��& 1
.
��1 2
TotalRecord
��2 =
}
�� 
;
�� 
if
�� 
(
�� 
!
�� 
isAdmin
��  
)
��  !
{
�� 
if
�� 
(
�� 

pageResult
�� &
.
��& '
Data
��' +
!=
��, .
null
��/ 3
&&
��4 6

pageResult
��7 A
.
��A B
Data
��B F
.
��F G
CountExt
��G O
(
��O P
)
��P Q
>
��R S
$num
��T U
)
��U V
{
�� 
for
�� 
(
��  !
int
��! $
index
��% *
=
��+ ,
$num
��- .
;
��. /
index
��0 5
<
��6 7

pageResult
��8 B
.
��B C
Data
��C G
.
��G H
CountExt
��H P
(
��P Q
)
��Q R
;
��R S
index
��T Y
++
��Y [
)
��[ \
{
�� 
var
��  #
product
��$ +
=
��, -

pageResult
��. 8
.
��8 9
Data
��9 =
[
��= >
index
��> C
]
��C D
;
��D E
if
��  "
(
��# $
product
��$ +
.
��+ ,
files
��, 1
==
��2 4
null
��5 9
)
��9 :
product
��; B
.
��B C
files
��C H
=
��I J
new
��K N
List
��O S
<
��S T
FileInfo
��T \
>
��\ ]
(
��] ^
)
��^ _
;
��_ `
var
��  #
base64Images
��$ 0
=
��1 2
await
��3 8)
GetBase64ImagesProductAsync
��9 T
(
��T U
product
��U \
.
��\ ]
id
��] _
)
��_ `
;
��` a
if
��  "
(
��# $
base64Images
��$ 0
!=
��1 3
null
��4 8
&&
��9 ;
base64Images
��< H
.
��H I
CountExt
��I Q
(
��Q R
)
��R S
>
��T U
$num
��V W
)
��W X
{
��  !
product
��$ +
.
��+ ,
files
��, 1
=
��2 3
base64Images
��4 @
.
��@ A
	SelectExt
��A J
(
��J K
x
��K L
=>
��M O
new
��P S
FileInfo
��T \
{
��] ^
path
��_ c
=
��d e
x
��f g
}
��h i
)
��i j
.
��j k
ToList
��k q
(
��q r
)
��r s
;
��s t
if
��$ &
(
��' (
product
��( /
.
��/ 0
files
��0 5
.
��5 6
CountExt
��6 >
(
��> ?
)
��? @
<=
��A C
$num
��D E
)
��E F
continue
��G O
;
��O P

pageResult
��$ .
.
��. /
Data
��/ 3
[
��3 4
index
��4 9
]
��9 :
.
��: ;
files
��; @
=
��A B
product
��C J
.
��J K
files
��K P
;
��P Q
}
��  !
var
��  #
colors
��$ *
=
��+ ,
await
��- 2
	_colorUoW
��3 <
.
��< =
Colors
��= C
.
��C D
GetAllAsync
��D O
(
��O P
x
��P Q
=>
��R T
x
��U V
.
��V W

product_id
��W a
==
��b d
product
��e l
.
��l m
id
��m o
)
��o p
;
��p q
if
��  "
(
��# $
colors
��$ *
.
��* +
CountExt
��+ 3
(
��3 4
)
��4 5
>
��6 7
$num
��8 9
)
��9 :
{
��; <

pageResult
��= G
.
��G H
Data
��H L
[
��L M
index
��M R
]
��R S
.
��S T
colors
��T Z
=
��[ \
colors
��] c
.
��c d
ToList
��d j
(
��j k
)
��k l
;
��l m
}
��n o
}
�� 
}
�� 
}
�� 
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
_logger
�� 
.
�� 

LogWarning
�� "
(
��" #
ex
��# %
,
��% &
$"
��' )
{
��) *
TAG
��* -
}
��- .
$str
��. \
{
��\ ]
ex
��] _
.
��_ `
Message
��` g
}
��g h
"
��h i
)
��i j
;
��j k
}
�� 
return
�� 

pageResult
�� 
;
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
InsertProductAsync
��  2
(
��2 3
ProductRequest
��3 A
request
��B I
)
��I J
{
�� 	
try
�� 
{
�� 
var
�� 
product
�� 
=
�� 
(
�� 
Product
�� &
)
��& '
request
��' .
;
��. /
var
�� 
productInsert
�� !
=
��" #
await
��$ )
_productUoW
��* 5
.
��5 6
Products
��6 >
.
��> ?
InsertOneAsync
��? M
(
��M N
product
��N U
)
��U V
;
��V W
if
�� 
(
�� 
productInsert
�� !
!=
��" $
null
��% )
)
��) *
{
�� 
if
�� 
(
�� 
request
�� 
.
��  
files
��  %
.
��% &
CountExt
��& .
(
��. /
)
��/ 0
>
��1 2
$num
��3 4
)
��4 5
{
�� 
await
�� 
InsertImagesAsync
�� /
(
��/ 0
request
��0 7
.
��7 8
files
��8 =
,
��= >
request
��? F
.
��F G
id
��G I
)
��I J
;
��J K
}
�� 
if
�� 
(
�� 
request
�� 
.
��  
colors
��  &
.
��& '
CountExt
��' /
(
��/ 0
)
��0 1
>
��2 3
$num
��4 5
)
��5 6
{
�� 
request
�� 
.
��  
colors
��  &
.
��& '
ForEach
��' .
(
��. /
x
��/ 0
=>
��1 3
x
��4 5
.
��5 6

product_id
��6 @
=
��A B
productInsert
��C P
.
��P Q
id
��Q S
)
��S T
;
��T U
var
�� 
insertColos
�� '
=
��( )
await
��* /
	_colorUoW
��0 9
.
��9 :
Colors
��: @
.
��@ A
InsertManyAsync
��A P
(
��P Q
request
��Q X
.
��X Y
colors
��Y _
)
��_ `
;
��` a
if
�� 
(
�� 
insertColos
�� '
.
��' (
CountExt
��( 0
(
��0 1
)
��1 2
>
��3 4
$num
��5 6
)
��6 7
{
�� 
productInsert
�� )
.
��) *
quantity
��* 2
=
��3 4
request
��5 <
.
��< =
colors
��= C
.
��C D
SumExt
��D J
(
��J K
x
��K L
=>
��M O
x
��P Q
.
��Q R
amount
��R X
)
��X Y
;
��Y Z
await
�� !
_productUoW
��" -
.
��- .
Products
��. 6
.
��6 7
UpdateOneAsync
��7 E
(
��E F
productInsert
��F S
)
��S T
;
��T U
}
�� 
}
�� 
}
�� 
return
�� 
productInsert
�� $
!=
��% '
null
��( ,
;
��, -
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
UpdateProductAsync
��  2
(
��2 3
ProductRequest
��3 A
productRequest
��B P
)
��P Q
{
�� 	
var
�� 
product
�� 
=
�� 
MapperExtensions
�� *
.
��* +

MapperData
��+ 5
<
��5 6
ProductRequest
��6 D
,
��D E
Product
��F M
>
��M N
(
��N O
productRequest
��O ]
)
��] ^
;
��^ _
var
�� 
productUpdate
�� 
=
�� 
await
��  %
_productUoW
��& 1
.
��1 2
Products
��2 :
.
��: ;
UpdateOneAsync
��; I
(
��I J
product
��J Q
)
��Q R
;
��R S
if
�� 
(
�� 
!
�� 
productUpdate
�� 
)
�� 
return
��  &
false
��' ,
;
��, -
if
�� 
(
�� 
productRequest
�� 
.
�� 
files
�� $
==
��% '
null
��( ,
||
��- /
productRequest
��0 >
.
��> ?
files
��? D
.
��D E
CountExt
��E M
(
��M N
)
��N O
<=
��P R
$num
��S T
)
��T U
return
��V \
productUpdate
��] j
;
��j k
var
�� 
files
�� 
=
�� 
productRequest
�� &
.
��& '
files
��' ,
.
��, -
Where
��- 2
(
��2 3
x
��3 4
=>
��5 7
!
��8 9
x
��9 :
.
��: ;
path
��; ?
.
��? @'
IsNullOrEmptyOrWhiteSpace
��@ Y
(
��Y Z
)
��Z [
)
��[ \
.
��\ ]
ToList
��] c
(
��c d
)
��d e
;
��e f
var
�� 
images
�� 
=
�� 
await
�� 
	_imageUoW
�� (
.
��( )
Images
��) /
.
��/ 0
GetAllAsync
��0 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C

product_id
��C M
==
��N P
productRequest
��Q _
.
��_ `
id
��` b
)
��b c
;
��c d
var
�� 
updateColors
�� 
=
�� 
await
�� $ 
UpdateColorProduct
��% 7
(
��7 8
product
��8 ?
,
��? @
productRequest
��A O
.
��O P
colors
��P V
)
��V W
;
��W X
if
�� 
(
�� 
updateColors
�� 
)
�� 
{
�� 
await
�� 
_productUoW
�� !
.
��! "
Products
��" *
.
��* +
UpdateOneAsync
��+ 9
(
��9 :
product
��: A
)
��A B
;
��B C
}
�� 
return
�� 
productUpdate
��  
;
��  !
}
�� 	
public
�� 
async
�� 
Task
�� 
<
�� 
ProductRespone
�� (
>
��( )
GetProductAsync
��* 9
(
��9 :
string
��: @
	productId
��A J
)
��J K
{
�� 	
var
�� 
productRespone
�� 
=
��  
new
��! $
ProductRespone
��% 3
(
��3 4
)
��4 5
;
��5 6
var
�� 
product
�� 
=
�� 
await
�� 
_productUoW
��  +
.
��+ ,
Products
��, 4
.
��4 5
GetByIdAsync
��5 A
(
��A B
	productId
��B K
)
��K L
;
��L M
if
�� 
(
�� 
product
�� 
==
�� 
null
�� 
)
��  
return
��! '
null
��( ,
;
��, -
productRespone
�� 
=
�� 
MapperExtensions
�� -
.
��- .

MapperData
��. 8
<
��8 9
Product
��9 @
,
��@ A
ProductRespone
��B P
>
��P Q
(
��Q R
product
��R Y
)
��Y Z
;
��Z [
if
�� 
(
�� 
productRespone
�� 
.
�� 
files
�� $
==
��% '
null
��( ,
)
��, -
productRespone
��. <
.
��< =
files
��= B
=
��C D
new
��E H
List
��I M
<
��M N
FileInfo
��N V
>
��V W
(
��W X
)
��X Y
;
��Y Z
var
�� 
pathImagesProduct
�� !
=
��" #
FileExtensions
��$ 2
.
��2 3!
GetPathProductLocal
��3 F
(
��F G
)
��G H
;
��H I
var
�� 
base64Images
�� 
=
�� 
await
�� $)
GetBase64ImagesProductAsync
��% @
(
��@ A
product
��A H
.
��H I
id
��I K
,
��K L
true
��M Q
)
��Q R
;
��R S
if
�� 
(
�� 
base64Images
�� 
!=
�� 
null
��  $
&&
��% '
base64Images
��( 4
.
��4 5
CountExt
��5 =
(
��= >
)
��> ?
>
��@ A
$num
��B C
)
��C D
{
�� 
productRespone
�� 
.
�� 
files
�� $
=
��% &
base64Images
��' 3
.
��3 4
	SelectExt
��4 =
(
��= >
x
��> ?
=>
��@ B
new
��C F
FileInfo
��G O
{
��P Q
path
��R V
=
��W X
x
��Y Z
}
��[ \
)
��\ ]
.
��] ^
ToList
��^ d
(
��d e
)
��e f
;
��f g
}
�� 
var
�� 
colors
�� 
=
�� 
await
�� 
	_colorUoW
�� (
.
��( )
Colors
��) /
.
��/ 0
GetAllAsync
��0 ;
(
��; <
x
��< =
=>
��> @
x
��A B
.
��B C

product_id
��C M
==
��N P
product
��Q X
.
��X Y
id
��Y [
)
��[ \
;
��\ ]
if
�� 
(
�� 
colors
�� 
.
�� 
CountExt
�� 
(
��  
)
��  !
>
��" #
$num
��$ %
)
��% &
{
��' (
productRespone
��) 7
.
��7 8
colors
��8 >
=
��? @
colors
��A G
.
��G H
ToList
��H N
(
��N O
)
��O P
;
��P Q
}
��R S
return
�� 
productRespone
�� !
;
��! "
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  
InsertImagesAsync
��! 2
(
��2 3
List
��3 7
<
��7 8
FileInfo
��8 @
>
��@ A
	fileInfos
��B K
,
��K L
string
��M S
	productId
��T ]
)
��] ^
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
	fileInfos
�� 
.
�� 
CountExt
�� &
(
��& '
)
��' (
<=
��) +
$num
��, -
)
��- .
return
��/ 5
false
��6 ;
;
��; <
var
�� 
imagesInsert
��  
=
��! "
	fileInfos
��# ,
.
��, -
Select
��- 3
(
��3 4
(
��4 5
x
��5 6
,
��6 7
index
��8 =
)
��= >
=>
��? A
new
��B E
Image
��F K
(
��K L
)
��L M
{
�� 
path
�� 
=
�� 
GlobalConstant
�� )
.
��) * 
GetFullPathProduct
��* <
(
��< =
$"
��= ?
{
��? @
	productId
��@ I
}
��I J
$str
��J K
{
��K L
Guid
��L P
.
��P Q
NewGuid
��Q X
(
��X Y
)
��Y Z
}
��Z [
"
��[ \
,
��\ ]
FileExtensions
��^ l
.
��l m
GetFileExtention
��m }
(
��} ~
FileType��~ �
.��� �
Image��� �
)��� �
)��� �
,��� �

product_id
�� 
=
��  
	productId
��! *
,
��* +
	is_picked
�� 
=
�� 
true
��  $
}
�� 
)
�� 
.
�� 
ToList
�� 
(
�� 
)
�� 
;
�� 
var
�� 
insertImage
�� 
=
��  !
await
��" '
	_imageUoW
��( 1
.
��1 2
Images
��2 8
.
��8 9
InsertManyAsync
��9 H
(
��H I
imagesInsert
��I U
)
��U V
;
��V W
if
�� 
(
�� 
insertImage
�� 
.
��  
CountExt
��  (
(
��( )
)
��) *
>
��+ ,
$num
��- .
)
��. /
{
�� 
for
�� 
(
�� 
int
�� 
index
�� "
=
��# $
$num
��% &
;
��& '
index
��( -
<
��. /
	fileInfos
��0 9
.
��9 :
CountExt
��: B
(
��B C
)
��C D
;
��D E
index
��F K
++
��K M
)
��M N
{
�� 
var
�� 
byteFile
�� $
=
��% &
ConvertExtensions
��' 8
.
��8 9
ConvertFromBase64
��9 J
(
��J K
	fileInfos
��K T
[
��T U
index
��U Z
]
��Z [
.
��[ \
path
��\ `
)
��` a
;
��a b
var
�� 
insertStorage
�� )
=
��* +
await
��, 1
_storageClient
��2 @
.
��@ A
UploadFileAsync
��A P
(
��P Q
imagesInsert
��Q ]
[
��] ^
index
��^ c
]
��c d
.
��d e
path
��e i
,
��i j
byteFile
��k s
)
��s t
;
��t u
if
�� 
(
�� 
insertStorage
�� )
)
��) *
{
�� 
var
�� 
keyPathStorage
��  .
=
��/ 0'
GetKeyCachedProductImages
��1 J
(
��J K
	productId
��K T
)
��T U
;
��U V
await
�� !
_cached
��" )
.
��) *
SetAsync
��* 2
(
��2 3
keyPathStorage
��3 A
,
��A B
insertImage
��C N
.
��N O
	SelectExt
��O X
(
��X Y
x
��Y Z
=>
��[ ]
x
��^ _
.
��_ `
path
��` d
)
��d e
.
��e f
ToList
��f l
(
��l m
)
��m n
,
��n o
$num
��p r
*
��s t
$num
��u w
*
��x y
$num
��z |
)
��| }
;
��} ~
}
�� 
}
�� 
return
�� 
true
�� 
;
��  
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��   
UpdateColorProduct
��! 3
(
��3 4
Product
��4 ;
product
��< C
,
��C D
List
��E I
<
��I J
Color
��J O
>
��O P
colors
��Q W
)
��W X
{
�� 	
try
�� 
{
�� 
if
�� 
(
�� 
colors
�� 
.
�� 
CountExt
�� #
(
��# $
)
��$ %
<=
��& (
$num
��) *
)
��* +
return
��, 2
false
��3 8
;
��8 9
colors
�� 
.
�� 
ForEach
�� 
(
�� 
x
��  
=>
��! #
x
��$ %
.
��% &

product_id
��& 0
=
��1 2
product
��3 :
.
��: ;
id
��; =
)
��= >
;
��> ?
var
�� 
colorsDb
�� 
=
�� 
await
�� $
	_colorUoW
��% .
.
��. /
Colors
��/ 5
.
��5 6
GetAllAsync
��6 A
(
��A B
x
��B C
=>
��D F
x
��G H
.
��H I

product_id
��I S
==
��T V
product
��W ^
.
��^ _
id
��_ a
)
��a b
;
��b c
if
�� 
(
�� 
colorsDb
�� 
.
�� 
CountExt
�� %
(
��% &
)
��& '
<=
��( *
$num
��+ ,
)
��, -
return
��. 4
false
��5 :
;
��: ;
var
�� 
quantity
�� 
=
�� 
$num
��  
;
��  !
var
�� 
colorsInsert
��  
=
��! "
colors
��# )
.
��) *
WhereExt
��* 2
(
��2 3
x
��3 4
=>
��5 7
!
��8 9
colorsDb
��9 A
.
��A B
ToList
��B H
(
��H I
)
��I J
.
��J K
Exists
��K Q
(
��Q R
c
��R S
=>
��T V
x
��W X
.
��X Y
id
��Y [
.
��[ \
Equals
��\ b
(
��b c
c
��c d
.
��d e
id
��e g
)
��g h
)
��h i
)
��i j
.
��j k
ToList
��k q
(
��q r
)
��r s
;
��s t
if
�� 
(
�� 
colorsInsert
��  
.
��  !
CountExt
��! )
(
��) *
)
��* +
>
��, -
$num
��. /
)
��/ 0
{
�� 
await
�� 
	_colorUoW
�� #
.
��# $
Colors
��$ *
.
��* +
InsertManyAsync
��+ :
(
��: ;
colorsInsert
��; G
)
��G H
;
��H I
quantity
�� 
+=
�� 
colorsInsert
��  ,
.
��, -
SumExt
��- 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
amount
��; A
)
��A B
;
��B C
}
�� 
var
�� 
colorsUpdate
��  
=
��! "
colors
��# )
.
��) *
WhereExt
��* 2
(
��2 3
x
��3 4
=>
��5 7
colorsDb
��8 @
.
��@ A
ToList
��A G
(
��G H
)
��H I
.
��I J
Exists
��J P
(
��P Q
c
��Q R
=>
��S U
x
��V W
.
��W X
id
��X Z
.
��Z [
Equals
��[ a
(
��a b
c
��b c
.
��c d
id
��d f
)
��f g
)
��g h
)
��h i
.
��i j
ToList
��j p
(
��p q
)
��q r
;
��r s
if
�� 
(
�� 
colorsUpdate
��  
.
��  !
CountExt
��! )
(
��) *
)
��* +
>
��, -
$num
��. /
)
��/ 0
{
�� 
await
�� 
	_colorUoW
�� #
.
��# $
Colors
��$ *
.
��* +
UpdateManyAsync
��+ :
(
��: ;
colorsUpdate
��; G
)
��G H
;
��H I
quantity
�� 
+=
�� 
colorsUpdate
��  ,
.
��, -
SumExt
��- 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
amount
��; A
)
��A B
;
��B C
}
�� 
var
�� 
colorsDelete
��  
=
��! "
colorsDb
��# +
.
��+ ,
ToList
��, 2
(
��2 3
)
��3 4
.
��4 5
WhereExt
��5 =
(
��= >
x
��> ?
=>
��@ B
!
��C D
colors
��D J
.
��J K
Exists
��K Q
(
��Q R
c
��R S
=>
��T V
x
��W X
.
��X Y
id
��Y [
.
��[ \
Equals
��\ b
(
��b c
c
��c d
.
��d e
id
��e g
)
��g h
)
��h i
)
��i j
.
��j k
ToList
��k q
(
��q r
)
��r s
;
��s t
if
�� 
(
�� 
colorsDelete
��  
.
��  !
CountExt
��! )
(
��) *
)
��* +
>
��, -
$num
��. /
)
��/ 0
{
�� 
await
�� 
	_colorUoW
�� #
.
��# $
Colors
��$ *
.
��* +
DeleteManyAsync
��+ :
(
��: ;
colorsDelete
��; G
)
��G H
;
��H I
}
�� 
product
�� 
.
�� 
quantity
��  
=
��! "
quantity
��# +
;
��+ ,
return
�� 
true
�� 
;
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
false
�� 
;
�� 
}
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
bool
�� 
>
��  &
DeleteImagesProductAsync
��! 9
(
��9 :
string
��: @
	productId
��A J
,
��J K
List
��L P
<
��P Q
string
��Q W
>
��W X
paths
��Y ^
)
��^ _
{
�� 	
try
�� 
{
�� 
var
�� 
deleteImages
��  
=
��! "
await
��# (
	_imageUoW
��) 2
.
��2 3
Images
��3 9
.
��9 :
DeleteManyAsync
��: I
(
��I J
x
��J K
=>
��L N
x
��O P
.
��P Q

product_id
��Q [
==
��\ ^
	productId
��_ h
)
��h i
;
��i j
if
�� 
(
�� 
deleteImages
��  
)
��  !
{
�� 
var
�� 
	keyCached
�� !
=
��" #'
GetKeyCachedProductImages
��$ =
(
��= >
	productId
��> G
)
��G H
;
��H I
await
�� 
_cached
�� !
.
��! "
RemoveAsync
��" -
(
��- .
	keyCached
��. 7
)
��7 8
;
��8 9
if
�� 
(
�� 
paths
�� 
.
�� 
CountExt
�� &
(
��& '
)
��' (
>
��) *
$num
��+ ,
)
��, -
{
�� 
foreach
�� 
(
��  !
var
��! $
path
��% )
in
��* ,
paths
��- 2
)
��2 3
{
�� 
await
�� !
_storageClient
��" 0
.
��0 1$
DeleteFileStorageAsync
��1 G
(
��G H
path
��H L
)
��L M
;
��M N
}
�� 
}
�� 
return
�� 
true
�� 
;
��  
}
�� 
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
}
�� 
return
�� 
false
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
string
��  &
>
��& '
>
��' (.
 GetBase64ImagesProductLocalAsync
��) I
(
��I J
string
��J P
	productId
��Q Z
,
��Z [
bool
��\ `
isGetAllImage
��a n
=
��o p
false
��q v
)
��v w
{
�� 	
var
�� 
images
�� 
=
�� 
new
�� 
List
�� !
<
��! "
string
��" (
>
��( )
(
��) *
)
��* +
;
��+ ,
var
�� 
pathImagesProduct
�� !
=
��" #
$"
��$ &
{
��& '
FileExtensions
��' 5
.
��5 6!
GetPathProductLocal
��6 I
(
��I J
)
��J K
}
��K L
$str
��L N
{
��N O
	productId
��O X
}
��X Y
"
��Y Z
;
��Z [
var
�� 
checkFolderExist
��  
=
��! "
FileExtensions
��# 1
.
��1 2
CheckFolderExist
��2 B
(
��B C
pathImagesProduct
��C T
)
��T U
;
��U V
if
�� 
(
�� 
!
�� 
checkFolderExist
�� !
)
��! "
return
��# )
images
��* 0
;
��0 1
System
�� 
.
�� 
IO
�� 
.
�� 
DirectoryInfo
�� #
dir
��$ '
=
��( )
new
��* -
System
��. 4
.
��4 5
IO
��5 7
.
��7 8
DirectoryInfo
��8 E
(
��E F
pathImagesProduct
��F W
)
��W X
;
��X Y
var
�� 
filesInfolder
�� 
=
�� 
dir
��  #
.
��# $
GetFiles
��$ ,
(
��, -
$str
��- 5
)
��5 6
;
��6 7
if
�� 
(
�� 
filesInfolder
�� 
==
��  
null
��! %
||
��& (
filesInfolder
��) 6
.
��6 7
CountExt
��7 ?
(
��? @
)
��@ A
<=
��B D
$num
��E F
)
��F G
return
��H N
images
��O U
;
��U V
if
�� 
(
�� 
isGetAllImage
�� 
)
�� 
{
�� 
var
�� 
random
�� 
=
�� 
new
��  
Random
��! '
(
��' (
)
��( )
;
��) *
int
�� 
imageRandom
�� 
=
��  !
random
��" (
.
��( )
Next
��) -
(
��- .
filesInfolder
��. ;
.
��; <
Length
��< B
)
��B C
;
��C D
byte
�� 
[
�� 
]
�� 
fileData
�� 
=
��  !
FileExtensions
��" 0
.
��0 1
GetDataFile
��1 <
(
��< =
filesInfolder
��= J
[
��J K
imageRandom
��K V
]
��V W
.
��W X
FullName
��X `
)
��` a
;
��a b
var
�� 
base64Image
�� 
=
��  !
Convert
��" )
.
��) *
ToBase64String
��* 8
(
��8 9
fileData
��9 A
)
��A B
;
��B C
base64Image
�� 
=
�� 
$"
��  
$str
��  7
{
��7 8
base64Image
��8 C
}
��C D
"
��D E
;
��E F
if
�� 
(
�� 
!
�� 
base64Image
��  
.
��  !'
IsNullOrEmptyOrWhiteSpace
��! :
(
��: ;
)
��; <
)
��< =
images
��> D
.
��D E
Add
��E H
(
��H I
base64Image
��I T
)
��T U
;
��U V
}
�� 
else
�� 
{
�� 
foreach
�� 
(
�� 
var
�� 
file
�� !
in
��" $
filesInfolder
��% 2
)
��2 3
{
�� 
byte
�� 
[
�� 
]
�� 
fileData
�� #
=
��$ %
FileExtensions
��& 4
.
��4 5
GetDataFile
��5 @
(
��@ A
file
��A E
.
��E F
FullName
��F N
)
��N O
;
��O P
var
�� 
base64Image
�� #
=
��$ %
Convert
��& -
.
��- .
ToBase64String
��. <
(
��< =
fileData
��= E
)
��E F
;
��F G
base64Image
�� 
=
��  !
$"
��" $
$str
��$ ;
{
��; <
base64Image
��< G
}
��G H
"
��H I
;
��I J
if
�� 
(
�� 
!
�� 
base64Image
�� $
.
��$ %'
IsNullOrEmptyOrWhiteSpace
��% >
(
��> ?
)
��? @
)
��@ A
images
��B H
.
��H I
Add
��I L
(
��L M
base64Image
��M X
)
��X Y
;
��Y Z
}
�� 
}
�� 
return
�� 
images
�� 
;
�� 
}
�� 	
private
�� 
async
�� 
Task
�� 
<
�� 
List
�� 
<
��  
string
��  &
>
��& '
>
��' ()
GetBase64ImagesProductAsync
��) D
(
��D E
string
��E K
	productId
��L U
,
��U V
bool
��W [
isGetAllImage
��\ i
=
��j k
false
��l q
)
��q r
{
�� 	
try
�� 
{
�� 
var
�� 
cachedKeyImages
�� #
=
��$ %'
GetKeyCachedProductImages
��& ?
(
��? @
	productId
��@ I
)
��I J
;
��J K
var
�� 
pathDbImages
��  
=
��! "
await
��# (
_cached
��) 0
.
��0 1
GetAsync
��1 9
<
��9 :
List
��: >
<
��> ?
string
��? E
>
��E F
>
��F G
(
��G H
cachedKeyImages
��H W
)
��W X
;
��X Y
var
�� 
idImages
�� 
=
�� 
new
�� "
List
��# '
<
��' (
string
��( .
>
��. /
(
��/ 0
)
��0 1
;
��1 2
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
CountExt
��9 A
(
��A B
)
��B C
<=
��D F
$num
��G H
)
��H I
{
�� 
var
�� 
images
�� 
=
��  
await
��! &
	_imageUoW
��' 0
.
��0 1
Images
��1 7
.
��7 8
GetAllAsync
��8 C
(
��C D
x
��D E
=>
��F H
x
��I J
.
��J K

product_id
��K U
==
��V X
	productId
��Y b
)
��b c
;
��c d
if
�� 
(
�� 
images
�� 
!=
�� !
null
��" &
&&
��' )
images
��* 0
.
��0 1
CountExt
��1 9
(
��9 :
)
��: ;
>
��< =
$num
��> ?
)
��? @
{
�� 
pathDbImages
�� $
=
��% &
images
��' -
.
��- .
	SelectExt
��. 7
(
��7 8
x
��8 9
=>
��: <
x
��= >
.
��> ?
path
��? C
)
��C D
.
��D E
ToList
��E K
(
��K L
)
��L M
;
��M N
idImages
��  
=
��! "
images
��# )
.
��) *
	SelectExt
��* 3
(
��3 4
x
��4 5
=>
��6 8
x
��9 :
.
��: ;
id
��; =
)
��= >
.
��> ?
ToList
��? E
(
��E F
)
��F G
;
��G H
}
�� 
}
�� 
if
�� 
(
�� 
pathDbImages
��  
==
��! #
null
��$ (
||
��) +
pathDbImages
��, 8
.
��8 9
Count
��9 >
(
��> ?
)
��? @
<=
��A C
$num
��D E
)
��E F
return
��G M
new
��N Q
List
��R V
<
��V W
string
��W ]
>
��] ^
(
��^ _
)
��_ `
;
��` a
var
�� 

timeCached
�� 
=
��  
$num
��! #
*
��$ %
$num
��& (
*
��) *
$num
��+ -
;
��- .
await
�� 
_cached
�� 
.
�� 
SetAsync
�� &
(
��& '
cachedKeyImages
��' 6
,
��6 7
pathDbImages
��8 D
,
��D E

timeCached
��F P
)
��P Q
;
��Q R
var
�� 
base64Images
��  
=
��! "
new
��# &
List
��' +
<
��+ ,
string
��, 2
>
��2 3
(
��3 4
)
��4 5
;
��5 6
if
�� 
(
�� 
isGetAllImage
�� !
)
��! "
{
�� 
foreach
�� 
(
�� 
var
��  
path
��! %
in
��& (
pathDbImages
��) 5
)
��5 6
{
�� 
var
�� 
	byteImage
�� %
=
��& '
await
��( -
_storageClient
��. <
.
��< =
DownloadFileAsync
��= N
(
��N O
path
��O S
)
��S T
;
��T U
if
�� 
(
�� 
	byteImage
�� %
!=
��& (
null
��) -
&&
��. 0
	byteImage
��1 :
.
��: ;
Length
��; A
>
��B C
$num
��D E
)
��E F
{
�� 
var
�� 
base64Image
��  +
=
��, -
Convert
��. 5
.
��5 6
ToBase64String
��6 D
(
��D E
	byteImage
��E N
)
��N O
;
��O P
base64Image
�� '
=
��( )
$"
��* ,
$str
��, C
{
��C D
base64Image
��D O
}
��O P
"
��P Q
;
��Q R
if
�� 
(
��  
!
��  !
base64Image
��! ,
.
��, -'
IsNullOrEmptyOrWhiteSpace
��- F
(
��F G
)
��G H
)
��H I
{
�� 
base64Images
��  ,
.
��, -
Add
��- 0
(
��0 1
base64Image
��1 <
)
��< =
;
��= >
var
��  #
pathProductLocal
��$ 4
=
��5 6
$"
��7 9
{
��9 :
FileExtensions
��: H
.
��H I!
GetPathProductLocal
��I \
(
��\ ]
)
��] ^
}
��^ _
$str
��_ a
{
��a b
	productId
��b k
}
��k l
"
��l m
;
��m n
if
��  "
(
��# $
!
��$ %
FileExtensions
��% 3
.
��3 4
CheckFolderExist
��4 D
(
��D E
pathProductLocal
��E U
)
��U V
)
��V W
{
��  !
FileExtensions
��$ 2
.
��2 3
CreateFolder
��3 ?
(
��? @
pathProductLocal
��@ P
)
��P Q
;
��Q R
}
��  !
System
��  &
.
��& '
IO
��' )
.
��) *
File
��* .
.
��. /
WriteAllBytes
��/ <
(
��< =
$"
��= ?
{
��? @
pathProductLocal
��@ P
}
��P Q
$str
��Q S
{
��S T
FileExtensions
��T b
.
��b c&
GetFileNameByPathProduct
��c {
(
��{ |
path��| �
)��� �
}��� �
$str��� �
"��� �
,��� �
	byteImage��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
}
�� 
else
�� 
{
�� 
var
�� 
random
�� 
=
��  
new
��! $
Random
��% +
(
��+ ,
)
��, -
;
��- .
int
�� 
imageRandom
�� #
=
��$ %
random
��& ,
.
��, -
Next
��- 1
(
��1 2
pathDbImages
��2 >
.
��> ?
CountExt
��? G
(
��G H
)
��H I
)
��I J
;
��J K
var
�� 
	byteImage
�� !
=
��" #
await
��$ )
_storageClient
��* 8
.
��8 9
DownloadFileAsync
��9 J
(
��J K
pathDbImages
��K W
[
��W X
imageRandom
��X c
]
��c d
)
��d e
;
��e f
if
�� 
(
�� 
	byteImage
�� !
!=
��" $
null
��% )
&&
��* ,
	byteImage
��- 6
.
��6 7
Length
��7 =
>
��> ?
$num
��@ A
)
��A B
{
�� 
var
�� 
base64Image
�� '
=
��( )
Convert
��* 1
.
��1 2
ToBase64String
��2 @
(
��@ A
	byteImage
��A J
)
��J K
;
��K L
base64Image
�� #
=
��$ %
$"
��& (
$str
��( ?
{
��? @
base64Image
��@ K
}
��K L
"
��L M
;
��M N
if
�� 
(
�� 
!
�� 
base64Image
�� (
.
��( )'
IsNullOrEmptyOrWhiteSpace
��) B
(
��B C
)
��C D
)
��D E
{
�� 
base64Images
�� (
.
��( )
Add
��) ,
(
��, -
base64Image
��- 8
)
��8 9
;
��9 :
var
�� 
pathProductLocal
��  0
=
��1 2
$"
��3 5
{
��5 6
FileExtensions
��6 D
.
��D E!
GetPathProductLocal
��E X
(
��X Y
)
��Y Z
}
��Z [
$str
��[ ]
{
��] ^
	productId
��^ g
}
��g h
"
��h i
;
��i j
if
�� 
(
��  
!
��  !
FileExtensions
��! /
.
��/ 0
CheckFolderExist
��0 @
(
��@ A
pathProductLocal
��A Q
)
��Q R
)
��R S
{
�� 
FileExtensions
��  .
.
��. /
CreateFolder
��/ ;
(
��; <
pathProductLocal
��< L
)
��L M
;
��M N
}
�� 
System
�� "
.
��" #
IO
��# %
.
��% &
File
��& *
.
��* +
WriteAllBytes
��+ 8
(
��8 9
$"
��9 ;
{
��; <
pathProductLocal
��< L
}
��L M
$str
��M O
{
��O P
FileExtensions
��P ^
.
��^ _&
GetFileNameByPathProduct
��_ w
(
��w x
pathDbImages��x �
[��� �
imageRandom��� �
]��� �
)��� �
}��� �
$str��� �
"��� �
,��� �
	byteImage��� �
)��� �
;��� �
}
�� 
}
�� 
}
�� 
return
�� 
base64Images
�� #
;
��# $
}
�� 
catch
�� 
(
�� 
	Exception
�� 
ex
�� 
)
��  
{
�� 
return
�� 
new
�� 
List
�� 
<
��  
string
��  &
>
��& '
(
��' (
)
��( )
;
��) *
}
�� 
}
�� 	
private
�� 
string
�� '
GetKeyCachedProductImages
�� 0
(
��0 1
string
��1 7
	productId
��8 A
)
��A B
=>
��C E
$"
��F H
$str
��H W
{
��W X
	productId
��X a
}
��a b
"
��b c
;
��c d
private
�� 
string
�� -
GetKeyCachedProductImagesBase64
�� 6
(
��6 7
string
��7 =
	productId
��> G
)
��G H
=>
��I K
$"
��L N
$str
��N b
{
��b c
	productId
��c l
}
��l m
"
��m n
;
��n o
}
�� 
}�� �
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
} �K
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
�� 
	resUpdate
��  
;
��  !
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
}�� �
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
} �
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
c �
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
} �
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
} �
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
}<< �J
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
userIds	__{ �
)
__� �
}
__� �
"
__� �
)
__� �
;
__� �
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
�� 
return
�� 
await
�� 
_userUoW
�� !
.
��! "
Users
��" '
.
��' (
GetPaggingAsync
��( 7
(
��7 8

pagination
��8 B
,
��B C
x
��< =
=>
��> @
x
��A B
.
��B C
	user_name
��C L
.
��L M
ContainsText
��M Y
(
��Y Z

pagination
��Z d
.
��d e
Filter
��e k
)
��k l
)
��l m
;
��m n
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
User
�� 
>
�� $
GetUserByUserNameAsync
��  6
(
��6 7
string
��7 =
userName
��> F
)
��F G
{
�� 	
var
�� 
users
�� 
=
�� 
await
�� 
_userUoW
�� &
.
��& '
Users
��' ,
.
��, -
GetAllAsync
��- 8
(
��8 9
x
��9 :
=>
��; =
x
��> ?
.
��? @
	user_name
��@ I
.
��I J
Equals
��J P
(
��P Q
userName
��Q Y
)
��Y Z
)
��Z [
;
��[ \
if
�� 
(
�� 
users
�� 
.
�� 
CountExt
�� 
(
�� 
)
��  
<=
��! #
$num
��$ %
)
��% &
return
��' -
null
��. 2
;
��2 3
return
�� 
users
�� 
.
�� 
FirstOrDefault
�� '
(
��' (
)
��( )
;
��) *
}
�� 	
}
�� 
}�� �
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
} �
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
}(( �
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