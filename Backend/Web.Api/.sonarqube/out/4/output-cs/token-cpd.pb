Ø
uC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\BackgroundServices\BackgroundServiceUtility.cs
	namespace 	
Web
 
. 
Utils 
. 
BackgroundServices &
{ 
public		 

static		 
class		 $
BackgroundServiceUtility		 0
{

 
public 
static 
TimeSpan 

GetWaiting )
() *
int* -
hour. 2
,2 3
int4 7
minute8 >
,> ?
int@ C
secondD J
)J K
{ 	
var 
now 
= 
DateTime 
. 
Now "
;" #
var 
runningDate 
= 
new !
DateTime" *
(* +
now+ .
.. /
Year/ 3
,3 4
now5 8
.8 9
Month9 >
,> ?
now@ C
.C D
DayD G
,G H
hourI M
,M N
minuteO U
,U V
secondW ]
)] ^
;^ _
if 
( 
runningDate 
<= 
now "
)" #
{ 
runningDate 
= 
runningDate )
.) *
AddDays* 1
(1 2
$num2 3
)3 4
;4 5
} 
TimeSpan 
waiting 
= 
runningDate *
.* +
Subtract+ 3
(3 4
now4 7
)7 8
;8 9
return 
waiting 
; 
} 	
public 
static 
TimeSpan 

GetWaiting )
() *
int* -

secondWait. 8
)8 9
{ 	
var 
now 
= 
DateTime 
. 
Now "
;" #
var 
runningDate 
= 
now !
.! "

AddSeconds" ,
(, -

secondWait- 7
)7 8
;8 9
TimeSpan 
waiting 
= 
runningDate *
.* +
Subtract+ 3
(3 4
now4 7
)7 8
;8 9
return 
waiting 
; 
} 	
} 
} ≠
mC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\ConvertExtensions\ConvertExtensions.cs
	namespace 	
Web
 
. 
Utils 
{ 
public		 

static		 
class		 
ConvertExtensions		 )
{

 
public 
static 
byte 
[ 
] 
ConvertFromBase64 .
(. /
string/ 5
base64String6 B
)B C
{ 	
if 
( 
base64String 
. %
IsNullOrEmptyOrWhiteSpace 6
(6 7
)7 8
)8 9
return: @
nullA E
;E F
return 
Convert 
. 
FromBase64String +
(+ , 
FormatStandardBase64, @
(@ A
base64StringA M
)M N
)N O
;O P
} 	
public 
static 
string  
FormatStandardBase64 1
(1 2
string2 8
base64String9 E
)E F
=>G I
base64StringJ V
.H I
ReplaceTextI T
(T U
$strU n
,n o
$strp r
)r s
.H I
ReplaceTextI T
(T U
$strU m
,m n
$stro q
)q r
;r s
} 
} “(
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\FileExtension\FileExtensions.cs
	namespace 	
Web
 
. 
Utils 
{ 
public 

static 
class 
FileExtensions &
{ 
public 
static 
string 
GetFileExtention -
(- .
FileType. 6
fileType7 ?
)? @
{ 	
var 
	extension 
= 
string "
." #
Empty# (
;( )
switch 
( 
fileType 
) 
{ 
case 
FileType 
. 
Image #
:# $
	extension 
= 
$str  &
;& '
break 
; 
default 
: 
	extension 
= 
$str  &
;& '
break 
; 
} 
return 
	extension 
; 
} 	
public 
static 
void 
CreateFolder '
(' (
string( .
path/ 3
)3 4
=>5 7
	Directory8 A
.A B
CreateDirectoryB Q
(Q R
pathR V
)V W
;W X
public   
static   
byte   
[   
]   
GetDataFile   (
(  ( )
string  ) /
path  0 4
)  4 5
=>  6 8
File  9 =
.  = >
ReadAllBytes  > J
(  J K
path  K O
)  O P
;  P Q
public"" 
static"" 
bool"" 
CheckFolderExist"" +
(""+ ,
string"", 2
path""3 7
)""7 8
=>""9 ;
	Directory""< E
.""E F
Exists""F L
(""L M
path""M Q
)""Q R
;""R S
public$$ 
static$$ 
string$$ $
GetFileNameByPathProduct$$ 5
($$5 6
string$$6 <
path$$= A
)$$A B
=>$$C E
path$$F J
.$$J K
ReplaceText$$K V
($$V W
$str$$W a
,$$a b
$str$$c e
)$$e f
;$$f g
public&& 
static&& 
string&& !
GetFileNameByPathBlog&& 2
(&&2 3
string&&3 9
path&&: >
)&&> ?
=>&&@ B
path&&C G
.&&G H
ReplaceText&&H S
(&&S T
$str&&T [
,&&[ \
$str&&] _
)&&_ `
;&&` a
public(( 
static(( 
string(( !
GetPathDirtoryCurrent(( 2
(((2 3
)((3 4
=>((5 7
	Directory((8 A
.((A B
GetCurrentDirectory((B U
(((U V
)((V W
;((W X
public** 
static** 
string** %
GetPathProductLocalClient** 6
(**6 7
)**7 8
{++ 	
var,, 
path,, 
=,, 
$",, 
{,, 
	Directory,, #
.,,# $
GetCurrentDirectory,,$ 7
(,,7 8
),,8 9
},,9 :
",,: ;
;,,; <
var-- 

pathClient-- 
=-- 
path-- !
.--! "

RegexMatch--" ,
(--, -
$str--- B
)--B C
.--C D
	GroupText--D M
(--M N
$num--N O
)--O P
;--P Q
return.. 
$".. 
{.. 

pathClient..  
}..  !
$str..! A
"..A B
;..B C
}// 	
public11 
static11 
string11 "
GetPathBlogLocalClient11 3
(113 4
)114 5
{22 	
var33 
path33 
=33 
$"33 
{33 
	Directory33 #
.33# $
GetCurrentDirectory33$ 7
(337 8
)338 9
}339 :
"33: ;
;33; <
var44 

pathClient44 
=44 
path44 !
.44! "

RegexMatch44" ,
(44, -
$str44- B
)44B C
.44C D
	GroupText44D M
(44M N
$num44N O
)44O P
;44P Q
return55 
$"55 
{55 

pathClient55  
}55  !
$str55! >
"55> ?
;55? @
}66 	
public88 
static88 
string88 
GetPathProductLocal88 0
(880 1
)881 2
=>883 5
$"886 8
{888 9
	Directory889 B
.88B C
GetCurrentDirectory88C V
(88V W
)88W X
}88X Y
$str88Y p
"88p q
;88q r
public:: 
static:: 
string:: 
GetPathBlogLocal:: -
(::- .
)::. /
=>::0 2
$"::3 5
{::5 6
	Directory::6 ?
.::? @
GetCurrentDirectory::@ S
(::S T
)::T U
}::U V
$str::V j
"::j k
;::k l
}<< 
}== ˛@
dC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Genneral\GenneralExtention.cs
	namespace 	
Web
 
. 
Utils 
{ 
public		 

static		 
class		 
GenneralExtention		 )
{

 
public 
static 
IEnumerable !
<! "
TSource" )
>) *
WhereExt+ 3
<3 4
TSource4 ;
>; <
(< =
this= A
ICollectionB M
<M N
TSourceN U
>U V
sourcesW ^
,^ _
Func` d
<d e
TSourcee l
,l m
booln r
>r s
	predicatet }
)} ~
=>	 Å
sources
Ç â
?
â ä
.
ä ã
Where
ã ê
(
ê ë
n
ë í
=>
ì ï
	predicate
ñ ü
(
ü †
n
† °
)
° ¢
)
¢ £
??
§ ¶
null
ß ´
;
´ ¨
public 
static 
IEnumerable !
<! "
TResult" )
>) *
	SelectExt+ 4
<4 5
TSource5 <
,< =
TResult> E
>E F
(F G
thisG K
IEnumerableL W
<W X
TSourceX _
>_ `
sourcesa h
,h i
Funcj n
<n o
TSourceo v
,v w
TResultx 
>	 Ä
selector
Å â
)
â ä
=>
ã ç
sources
é ï
?
ï ñ
.
ñ ó
Select
ó ù
(
ù û
n
û ü
=>
† ¢
selector
£ ´
(
´ ¨
n
¨ ≠
)
≠ Æ
)
Æ Ø
??
∞ ≤
null
≥ ∑
;
∑ ∏
public 
static 
int 
CountExt "
<" #
TSource# *
>* +
(+ ,
this, 0
IEnumerable1 <
<< =
TSource= D
>D E
sourcesF M
,M N
FuncO S
<S T
TSourceT [
,[ \
bool] a
>a b
	predicatec l
)l m
=>n p
sourcesq x
?x y
.y z
Countz 
(	 Ä
n
Ä Å
=>
Ç Ñ
	predicate
Ö é
(
é è
n
è ê
)
ê ë
)
ë í
??
ì ï
$num
ñ ó
;
ó ò
public 
static 
int 
CountExt "
<" #
TSource# *
>* +
(+ ,
this, 0
IEnumerable1 <
<< =
TSource= D
>D E
sourcesF M
)M N
=>O Q
sourcesR Y
?Y Z
.Z [
Count[ `
(` a
)a b
??c e
$numf g
;g h
public 
static 
bool 
AnyExt !
<! "
TSource" )
>) *
(* +
this+ /
IEnumerable0 ;
<; <
TSource< C
>C D
sourcesE L
)L M
=>N P
sourcesQ X
?X Y
.Y Z
AnyZ ]
(] ^
)^ _
??` b
falsec h
;h i
public 
static 
bool 
AnyExt !
<! "
TSource" )
>) *
(* +
this+ /
IEnumerable0 ;
<; <
TSource< C
>C D
sourcesE L
,L M
FuncN R
<R S
TSourceS Z
,Z [
bool\ `
>` a
	predicateb k
)k l
=>m o
sourcesp w
?w x
.x y
Anyy |
(| }
n} ~
=>	 Å
	predicate
Ç ã
(
ã å
n
å ç
)
ç é
)
é è
??
ê í
false
ì ò
;
ò ô
public   
static   
float   
SumExt   "
<  " #
TSource  # *
>  * +
(  + ,
this  , 0
IEnumerable  1 <
<  < =
TSource  = D
>  D E
sources  F M
,  M N
Func  O S
<  S T
TSource  T [
,  [ \
float  ] b
>  b c
selector  d l
)  l m
=>  n p
sources  q x
?  x y
.  y z
Sum  z }
(  } ~
n  ~ 
=>
  Ä Ç
selector
  É ã
(
  ã å
n
  å ç
)
  ç é
)
  é è
??
  ê í
$num
  ì î
;
  î ï
public!! 
static!! 
int!! 
SumExt!!  
<!!  !
TSource!!! (
>!!( )
(!!) *
this!!* .
IEnumerable!!/ :
<!!: ;
TSource!!; B
>!!B C
sources!!D K
,!!K L
Func!!M Q
<!!Q R
TSource!!R Y
,!!Y Z
int!![ ^
>!!^ _
selector!!` h
)!!h i
=>!!j l
sources!!m t
?!!t u
.!!u v
Sum!!v y
(!!y z
n!!z {
=>!!| ~
selector	!! á
(
!!á à
n
!!à â
)
!!â ä
)
!!ä ã
??
!!å é
$num
!!è ê
;
!!ê ë
public"" 
static"" 
decimal"" 
SumExt"" $
(""$ %
this""% )
IEnumerable""* 5
<""5 6
decimal""6 =
>""= >
sources""? F
)""F G
=>""H J
sources""K R
?""R S
.""S T
Sum""T W
(""W X
)""X Y
??""Z \
$num""] ^
;""^ _
public## 
static## 
double## 
SumExt## #
(### $
this##$ (
IEnumerable##) 4
<##4 5
double##5 ;
>##; <
sources##= D
)##D E
=>##F H
sources##I P
?##P Q
.##Q R
Sum##R U
(##U V
)##V W
??##X Z
$num##[ \
;##\ ]
public$$ 
static$$ 
int$$ 
SumExt$$  
($$  !
this$$! %
IEnumerable$$& 1
<$$1 2
int$$2 5
>$$5 6
sources$$7 >
)$$> ?
=>$$@ B
sources$$C J
?$$J K
.$$K L
Sum$$L O
($$O P
)$$P Q
??$$R T
$num$$U V
;$$V W
public%% 
static%% 
float%% 
SumExt%% "
(%%" #
this%%# '
IEnumerable%%( 3
<%%3 4
float%%4 9
>%%9 :
sources%%; B
)%%B C
=>%%D F
sources%%G N
?%%N O
.%%O P
Sum%%P S
(%%S T
)%%T U
??%%V X
$num%%Y Z
;%%Z [
public&& 
static&& 
long&& 
SumExt&& !
(&&! "
this&&" &
IEnumerable&&' 2
<&&2 3
long&&3 7
>&&7 8
sources&&9 @
)&&@ A
=>&&B D
sources&&E L
?&&L M
.&&M N
Sum&&N Q
(&&Q R
)&&R S
??&&T V
$num&&W X
;&&X Y
public** 
static** 
IOrderedEnumerable** (
<**( )
TSource**) 0
>**0 1
	ThenByExt**2 ;
<**; <
TSource**< C
,**C D
TKey**E I
>**I J
(**J K
this**K O
IOrderedEnumerable**P b
<**b c
TSource**c j
>**j k
sources**l s
,**s t
Func**u y
<**y z
TSource	**z Å
,
**Å Ç
TKey
**É á
>
**á à
keySelector
**â î
)
**î ï
=>
**ñ ò
sources
**ô †
?
**† °
.
**° ¢
ThenBy
**¢ ®
(
**® ©
n
**© ™
=>
**´ ≠
keySelector
**Æ π
(
**π ∫
n
**∫ ª
)
**ª º
)
**º Ω
??
**æ ¿
default
**¡ »
;
**» …
},, 
}-- «V
aC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Genneral\QueryExtention.cs
	namespace		 	
Web		
 
.		 
Utils		 
{

 
public 

static 
class 
QueryExtention &
{ 
public 
static 
IOrderedQueryable '
<' (
T( )
>) *
OrderByCustom+ 8
<8 9
T9 :
>: ;
(; <
this< @

IQueryableA K
<K L
TL M
>M N
sourceO U
,U V
stringW ]
property^ f
,f g
stringh n

methodNameo y
)y z
{ 	
return 

ApplyOrder 
< 
T 
>  
(  !
source! '
,' (
property) 1
,1 2

methodName3 =
)= >
;> ?
} 	
public 
static 
IOrderedQueryable '
<' (
T( )
>) *
OrderByCustom+ 8
<8 9
T9 :
>: ;
(; <
this< @

IQueryableA K
<K L
TL M
>M N
sourceO U
,U V
stringW ]
property^ f
)f g
{ 	
return 

ApplyOrder 
< 
T 
>  
(  !
source! '
,' (
property) 1
,1 2
$str3 <
)< =
;= >
} 	
public&& 
static&& 
IOrderedQueryable&& '
<&&' (
T&&( )
>&&) *#
OrderByDescendingCustom&&+ B
<&&B C
T&&C D
>&&D E
(&&E F
this&&F J

IQueryable&&K U
<&&U V
T&&V W
>&&W X
source&&Y _
,&&_ `
string&&a g
property&&h p
)&&p q
{'' 	
return(( 

ApplyOrder(( 
<(( 
T(( 
>((  
(((  !
source((! '
,((' (
property(() 1
,((1 2
$str((3 F
)((F G
;((G H
})) 	
public33 
static33 
IOrderedQueryable33 '
<33' (
T33( )
>33) *
ThenByCustom33+ 7
<337 8
T338 9
>339 :
(33: ;
this33; ?
IOrderedQueryable33@ Q
<33Q R
T33R S
>33S T
source33U [
,33[ \
string33] c
property33d l
)33l m
{44 	
return55 

ApplyOrder55 
<55 
T55 
>55  
(55  !
source55! '
,55' (
property55) 1
,551 2
$str553 ;
)55; <
;55< =
}66 	
public@@ 
static@@ 
IOrderedQueryable@@ '
<@@' (
T@@( )
>@@) *"
ThenByDescendingCustom@@+ A
<@@A B
T@@B C
>@@C D
(@@D E
this@@E I
IOrderedQueryable@@J [
<@@[ \
T@@\ ]
>@@] ^
source@@_ e
,@@e f
string@@g m
property@@n v
)@@v w
{AA 	
returnBB 

ApplyOrderBB 
<BB 
TBB 
>BB  
(BB  !
sourceBB! '
,BB' (
propertyBB) 1
,BB1 2
$strBB3 E
)BBE F
;BBF G
}CC 	
staticMM 
IOrderedQueryableMM  
<MM  !
TMM! "
>MM" #

ApplyOrderMM$ .
<MM. /
TMM/ 0
>MM0 1
(MM1 2

IQueryableMM2 <
<MM< =
TMM= >
>MM> ?
sourceMM@ F
,MMF G
stringMMH N
propertyMMO W
,MMW X
stringMMY _

methodNameMM` j
)MMj k
{NN 	
stringOO 
[OO 
]OO 
propsOO 
=OO 
propertyOO %
.OO% &
SplitOO& +
(OO+ ,
$charOO, /
)OO/ 0
;OO0 1
TypePP 
typePP 
=PP 
typeofPP 
(PP 
TPP  
)PP  !
;PP! "
ParameterExpressionQQ 
argQQ  #
=QQ$ %

ExpressionQQ& 0
.QQ0 1
	ParameterQQ1 :
(QQ: ;
typeQQ; ?
,QQ? @
$strQQA D
)QQD E
;QQE F

ExpressionRR 
exprRR 
=RR 
argRR !
;RR! "
foreachSS 
(SS 
stringSS 
propSS  
inSS! #
propsSS$ )
)SS) *
{TT 
PropertyInfoVV 
piVV 
=VV  !
typeVV" &
.VV& '
GetPropertyVV' 2
(VV2 3
propVV3 7
)VV7 8
;VV8 9
exprWW 
=WW 

ExpressionWW !
.WW! "
PropertyWW" *
(WW* +
exprWW+ /
,WW/ 0
piWW1 3
)WW3 4
;WW4 5
typeXX 
=XX 
piXX 
.XX 
PropertyTypeXX &
;XX& '
}YY 
TypeZZ 
delegateTypeZZ 
=ZZ 
typeofZZ  &
(ZZ& '
FuncZZ' +
<ZZ+ ,
,ZZ, -
>ZZ- .
)ZZ. /
.ZZ/ 0
MakeGenericTypeZZ0 ?
(ZZ? @
typeofZZ@ F
(ZZF G
TZZG H
)ZZH I
,ZZI J
typeZZK O
)ZZO P
;ZZP Q
LambdaExpression[[ 
lambda[[ #
=[[$ %

Expression[[& 0
.[[0 1
Lambda[[1 7
([[7 8
delegateType[[8 D
,[[D E
expr[[F J
,[[J K
arg[[L O
)[[O P
;[[P Q
object]] 
result]] 
=]] 
typeof]] "
(]]" #
	Queryable]]# ,
)]], -
.]]- .

GetMethods]]. 8
(]]8 9
)]]9 :
.]]: ;
Single]]; A
(]]A B
method^^ 
=>^^ 
method^^ $
.^^$ %
Name^^% )
==^^* ,

methodName^^- 7
&&__ 
method__ %
.__% &%
IsGenericMethodDefinition__& ?
&&`` 
method`` %
.``% &
GetGenericArguments``& 9
(``9 :
)``: ;
.``; <
Length``< B
==``C E
$num``F G
&&aa 
methodaa %
.aa% &
GetParametersaa& 3
(aa3 4
)aa4 5
.aa5 6
Lengthaa6 <
==aa= ?
$numaa@ A
)aaA B
.bb 
MakeGenericMethodbb &
(bb& '
typeofbb' -
(bb- .
Tbb. /
)bb/ 0
,bb0 1
typebb2 6
)bb6 7
.cc 
Invokecc 
(cc 
nullcc  
,cc  !
newcc" %
objectcc& ,
[cc, -
]cc- .
{cc/ 0
sourcecc1 7
,cc7 8
lambdacc9 ?
}cc@ A
)ccA B
;ccB C
returndd 
(dd 
IOrderedQueryabledd %
<dd% &
Tdd& '
>dd' (
)dd( )
resultdd) /
;dd/ 0
}ee 	
publicoo 
staticoo 
Listoo 
<oo 
Too 
>oo 
Filteroo $
<oo$ %
Too% &
>oo& '
(oo' (
thisoo( ,
Listoo- 1
<oo1 2
Too2 3
>oo3 4
sourceoo5 ;
,oo; <
stringoo= C

columnNameooD N
,ooN O
stringooP V
	compValueooW `
)oo` a
{pp 	
ParameterExpressionqq 
	parameterqq  )
=qq* +

Expressionqq, 6
.qq6 7
	Parameterqq7 @
(qq@ A
typeofqqA G
(qqG H
TqqH I
)qqI J
,qqJ K
$strqqL O
)qqO P
;qqP Q

Expressionrr 
propertyrr 
=rr  !

Expressionrr" ,
.rr, -
Propertyrr- 5
(rr5 6
	parameterrr6 ?
,rr? @

columnNamerrA K
)rrK L
;rrL M

Expressionss 
constantss 
=ss  !

Expressionss" ,
.ss, -
Constantss- 5
(ss5 6
	compValuess6 ?
)ss? @
;ss@ A

Expressiontt 
equalitytt 
=tt  !

Expressiontt" ,
.tt, -
Equaltt- 2
(tt2 3
propertytt3 ;
,tt; <
constanttt= E
)ttE F
;ttF G

Expressionuu 
<uu 
Funcuu 
<uu 
Tuu 
,uu 
booluu #
>uu# $
>uu$ %
	predicateuu& /
=uu0 1

Expressionvv 
.vv 
Lambdavv !
<vv! "
Funcvv" &
<vv& '
Tvv' (
,vv( )
boolvv* .
>vv. /
>vv/ 0
(vv0 1
equalityvv1 9
,vv9 :
	parametervv; D
)vvD E
;vvE F
Funcxx 
<xx 
Txx 
,xx 
boolxx 
>xx 
compiledxx "
=xx# $
	predicatexx% .
.xx. /
Compilexx/ 6
(xx6 7
)xx7 8
;xx8 9
returnyy 
sourceyy 
.yy 
Whereyy 
(yy  
compiledyy  (
)yy( )
.yy) *
ToListyy* 0
(yy0 1
)yy1 2
;yy2 3
}zz 	
public
ÇÇ 
static
ÇÇ 
List
ÇÇ 
<
ÇÇ 
T
ÇÇ 
>
ÇÇ 

PickRandom
ÇÇ (
<
ÇÇ( )
T
ÇÇ) *
>
ÇÇ* +
(
ÇÇ+ ,
this
ÇÇ, 0
List
ÇÇ1 5
<
ÇÇ5 6
T
ÇÇ6 7
>
ÇÇ7 8
source
ÇÇ9 ?
,
ÇÇ? @
int
ÇÇA D
count
ÇÇE J
)
ÇÇJ K
{
ÉÉ 	
return
ÑÑ 
source
ÑÑ 
.
ÑÑ 
Shuffle
ÑÑ !
(
ÑÑ! "
)
ÑÑ" #
.
ÑÑ# $
Take
ÑÑ$ (
(
ÑÑ( )
count
ÑÑ) .
)
ÑÑ. /
.
ÑÑ/ 0
ToList
ÑÑ0 6
(
ÑÑ6 7
)
ÑÑ7 8
;
ÑÑ8 9
}
ÖÖ 	
public
çç 
static
çç 
List
çç 
<
çç 
T
çç 
>
çç 
Shuffle
çç %
<
çç% &
T
çç& '
>
çç' (
(
çç( )
this
çç) -
List
çç. 2
<
çç2 3
T
çç3 4
>
çç4 5
source
çç6 <
)
çç< =
{
éé 	
return
èè 
source
èè 
.
èè 
OrderBy
èè !
(
èè! "
x
èè" #
=>
èè$ &
Guid
èè' +
.
èè+ ,
NewGuid
èè, 3
(
èè3 4
)
èè4 5
)
èè5 6
.
èè6 7
ToList
èè7 =
(
èè= >
)
èè> ?
;
èè? @
}
êê 	
}
ëë 
}íí ã
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\GlobalConstant\GlobalConstant.cs
	namespace 	
Web
 
. 
Utils 
{ 
public		 

static		 
class		 
GlobalConstant		 &
{

 
public 
static 
string 
GetFullPathTemplate 0
(0 1
string1 7

folderName8 B
,B C
stringD J
keyK N
)N O
=>P R
$"S U
{U V

folderNameV `
}` a
$stra b
{b c
keyc f
}f g
"g h
;h i
public 
static 
string 
GetFullPathProduct /
(/ 0
string0 6
fileName7 ?
,? @
stringA G
extentionFileH U
)U V
=>W Y
$"Z \
$str\ d
{d e
fileNamee m
}m n
{n o
extentionFileo |
}| }
"} ~
;~ 
public 
static 
string 
GetFullPathBlog ,
(, -
string- 3
fileName4 <
,< =
string> D
extentionFileE R
)R S
=>T V
$"W Y
$strY ^
{^ _
fileName_ g
}g h
{h i
extentionFilei v
}v w
"w x
;x y
} 
} ≥
fC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\JsonUtils\ByteArrayConverter.cs
	namespace 	
Web
 
. 
Utils 
{ 
public		 

static		 
class		 
ByteArrayConverter		 *
{

 
public 
static 
byte 
[ 
] 
Read !
(! "
ref" %
Utf8JsonReader& 4
reader5 ;
,; <
Type= A
typeToConvertB O
,O P!
JsonSerializerOptionsQ f
optionsg n
)n o
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
public 
static 
void 
Write  
(  !
Utf8JsonWriter! /
writer0 6
,6 7
byte8 <
[< =
]= >
value? D
,D E!
JsonSerializerOptionsF [
options\ c
)c d
{ 	
writer 
. 
WriteStartArray "
(" #
)# $
;$ %
foreach 
( 
var 
val 
in 
value  %
)% &
{ 
writer 
. 
WriteNumberValue '
(' (
val( +
)+ ,
;, -
} 
writer 
. 
WriteEndArray  
(  !
)! "
;" #
} 	
}   
}"" ì-
]C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\JsonUtils\JsonUtils.cs
	namespace 	
Web
 
. 
Utils 
{ 
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
	JsonUtils

 !
{ 
private 
static 
readonly 
string  &
TAG' *
=+ ,
$str- :
;: ;
public 
static 
readonly 
DateFormatHandling 1"
JsonDateFormatHandling2 H
=I J
DateFormatHandlingK ]
.] ^
IsoDateFormat^ k
;k l
public 
static 
readonly  
DateTimeZoneHandling 3$
JsonDateTimeZoneHandling4 L
=M N 
DateTimeZoneHandlingO c
.c d
Locald i
;i j
public 
static 
readonly 
string % 
JsonDateFormatString& :
=; <
$str= e
;e f
public 
static 
readonly 
NullValueHandling 0!
JsonNullValueHandling1 F
=G H
NullValueHandlingI Z
.Z [
Ignore[ a
;a b
public 
static 
readonly !
ReferenceLoopHandling 4%
JsonReferenceLoopHandling5 N
=O P!
ReferenceLoopHandlingQ f
.f g
Ignoreg m
;m n
private 
static "
JsonSerializerSettings -"
_jsonSerializerSetting. D
=E F
nullG K
;K L
public 
static "
JsonSerializerSettings ,%
GetJsonSerializerSettings- F
(F G
)G H
{ 	
if 
( "
_jsonSerializerSetting &
==' )
null* .
). /
{   "
_jsonSerializerSetting!! &
=!!' (
new!!) ,"
JsonSerializerSettings!!- C
(!!C D
)!!D E
{"" 
DateFormatHandling## &
=##' ("
JsonDateFormatHandling##) ?
,##? @ 
DateTimeZoneHandling$$ (
=$$) *$
JsonDateTimeZoneHandling$$+ C
,$$C D
DateFormatString%% $
=%%% & 
JsonDateFormatString%%' ;
,%%; <
NullValueHandling&& %
=&&& '!
JsonNullValueHandling&&( =
,&&= >!
ReferenceLoopHandling'' )
=''* +%
JsonReferenceLoopHandling'', E
}(( 
;(( 
})) 
return** "
_jsonSerializerSetting** )
;**) *
}++ 	
public33 
static33 
string33 
	Serialize33 &
(33& '
object33' -
obj33. 1
,331 2"
JsonSerializerSettings333 I
settings33J R
=33S T
null33U Y
)33Y Z
{44 	
try55 
{66 
if77 
(77 
settings77 
==77 
null77  $
)77$ %
{77& '
settings77( 0
=771 2%
GetJsonSerializerSettings773 L
(77L M
)77M N
;77N O
}77P Q
return88 
JsonConvert88 "
.88" #
SerializeObject88# 2
(882 3
obj883 6
,886 7
settings888 @
)88@ A
;88A B
}99 
catch:: 
(:: 
	Exception:: 
ex:: 
)::  
{;; 
throw<< 
ex<< 
;<< 
}== 
}>> 	
publicGG 
staticGG 
TGG 
DeserializeGG #
<GG# $
TGG$ %
>GG% &
(GG& '
thisGG' +
stringGG, 2
jsonGG3 7
,GG7 8"
JsonSerializerSettingsGG9 O
settingsGGP X
=GGY Z
nullGG[ _
)GG_ `
{HH 	
tryII 
{JJ 
ifKK 
(KK 
settingsKK 
==KK 
nullKK  $
)KK$ %
{KK& '
settingsKK( 0
=KK1 2%
GetJsonSerializerSettingsKK3 L
(KKL M
)KKM N
;KKN O
}KKP Q
returnLL 
JsonConvertLL "
.LL" #
DeserializeObjectLL# 4
<LL4 5
TLL5 6
>LL6 7
(LL7 8
jsonLL8 <
,LL< =
settingsLL> F
)LLF G
;LLG H
}MM 
catchNN 
(NN 
	ExceptionNN 
exNN 
)NN  
{OO 
throwPP 
exPP 
;PP 
}QQ 
}RR 	
public[[ 
static[[ 
object[[ 
Deserialize[[ (
([[( )
string[[) /
json[[0 4
,[[4 5
Type[[6 :
type[[; ?
,[[? @"
JsonSerializerSettings[[A W
settings[[X `
=[[a b
null[[c g
)[[g h
{\\ 	
try]] 
{^^ 
if__ 
(__ 
settings__ 
==__ 
null__  $
)__$ %
{__& '
settings__( 0
=__1 2%
GetJsonSerializerSettings__3 L
(__L M
)__M N
;__N O
}__P Q
return`` 
JsonConvert`` "
.``" #
DeserializeObject``# 4
(``4 5
json``5 9
,``9 :
type``; ?
,``? @
settings``A I
)``I J
;``J K
}aa 
catchbb 
(bb 
	Exceptionbb 
exbb 
)bb  
{cc 
throwdd 
exdd 
;dd 
}ee 
}ff 	
}gg 
}hh ≈
^C:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Logging\LogExtention.cs
	namespace 	
Web
 
. 
Utils 
. 
Logging 
{ 
public		 

class		 
LogExtention		 
{

 
} 
} Ï
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\MapperExtensions\MapperExtensions.cs
	namespace 	
Web
 
. 
Utils 
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
 
MapperExtensions

 (
{ 
public 
static 
TDestination "

MapperData# -
<- .
TSource. 5
,5 6
TDestination7 C
>C D
(D E
TSourceE L
sourceM S
)S T
{ 	
try 
{ 
var 
config 
= 
new  
MapperConfiguration! 4
(4 5
cfg5 8
=>9 ;
cfg< ?
.? @
	CreateMap@ I
<I J
TSourceJ Q
,Q R
TDestinationS _
>_ `
(` a
)a b
)b c
;c d
var 
mapper 
= 
config #
.# $
CreateMapper$ 0
(0 1
)1 2
;2 3
TDestination 
destination (
=) *
mapper+ 1
.1 2
Map2 5
<5 6
TDestination6 B
>B C
(C D
sourceD J
)J K
;K L
return 
destination "
;" #
} 
catch 
( 
	Exception 
ex 
)  
{ 
return 
default 
; 
} 
} 	
} 
} ù
iC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\RegexExtensions\RegexExtentions.cs
	namespace 	
Web
 
. 
Utils 
. 
RegexExtensions #
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
 
RegexExtentions

 '
{ 
public 
static 
Match 

RegexMatch &
(& '
this' +
string, 2
content3 :
,: ;
string< B
patternC J
)J K
{ 	
if 
( 
content 
. %
IsNullOrEmptyOrWhiteSpace 1
(1 2
)2 3
)3 4
return5 ;
null< @
;@ A
return 
Regex 
. 
Match 
( 
content &
,& '
pattern( /
)/ 0
;0 1
} 	
public 
static 
string 
	GroupText &
(& '
this' +
Match, 1
match2 7
,7 8
int9 <
index= B
)B C
{ 	
if 
( 
match 
== 
null 
) 
return %
string& ,
., -
Empty- 2
;2 3
var 
groups 
= 
match 
. 
Groups %
;% &
if 
( 
groups 
== 
null 
|| !
groups" (
.( )
Count) .
<=/ 1
$num2 3
||4 6
groups7 =
[= >
index> C
]C D
==E G
nullH L
||M O
stringP V
.V W
IsNullOrEmptyW d
(d e
groupse k
[k l
indexl q
]q r
.r s
Values x
)x y
)y z
return	{ Å
string
Ç à
.
à â
Empty
â é
;
é è
return 
groups 
[ 
index 
]  
.  !
Value! &
;& '
} 	
} 
} È
gC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Shared\Config\ConfigExtension.cs
	namespace

 	
Web


 
.

 
Utils

 
.

 
Shared

 
{ 
public 

static 
class 
ConfigExtension '
{ 
private 
const 
string 
AppSettingConfig -
=. /
$str0 O
;O P
public 
static 
IHostBuilder "
ConfigAppSettings# 4
(4 5
this5 9
IHostBuilder: F
builderG N
)N O
{ 	
string 
configFilePath !
=" #
Environment$ /
./ 0"
GetEnvironmentVariable0 F
(F G
AppSettingConfigG W
)W X
;X Y
if 
( 
string 
. 
IsNullOrEmpty #
(# $
configFilePath$ 2
)2 3
||4 6
!7 8
File8 <
.< =
Exists= C
(C D
configFilePathD R
)R S
)S T
{ 
string 
appSettingsFileName *
=+ ,
$str- >
;> ?
string 
basePath 
=  !

AppContext" ,
., -
BaseDirectory- :
;: ;
configFilePath 
=  
Path! %
.% &
Combine& -
(- .
basePath. 6
,6 7
$str8 @
,@ A
appSettingsFileNameB U
)U V
;V W
if 
( 
! 
File 
. 
Exists  
(  !
configFilePath! /
)/ 0
)0 1
{ 
configFilePath "
=# $
Path% )
.) *
Combine* 1
(1 2
basePath2 :
,: ;
appSettingsFileName< O
)O P
;P Q
} 
}   
if"" 
("" 
File"" 
."" 
Exists"" 
("" 
configFilePath"" *
)""* +
)""+ ,
{## 
builder$$ 
.$$ %
ConfigureAppConfiguration$$ 1
($$1 2
($$2 3
hostContext$$3 >
,$$> ?
config$$@ F
)$$F G
=>$$H J
{%% 
}'' 
)'' 
;'' 
}(( 
return** 
builder** 
;** 
}++ 	
},, 
}-- m
kC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Shared\Config\NLogConfigExtention.csÄ
aC:\Users\hienv\OneDrive\Desktop\NVHIEN\DoAnTotNghiep\Backend\Web.Utils\Strings\StringExtension.cs
	namespace 	
Web
 
. 
Utils 
{ 
public		 

static		 
class		 
StringExtension		 '
{

 
public 
static 
bool %
IsNullOrEmptyOrWhiteSpace 4
(4 5
this5 9
string: @
valueA F
)F G
=>H J
stringK Q
.Q R
IsNullOrEmptyR _
(_ `
value` e
)e f
||g i
stringj p
.p q
IsNullOrWhiteSpace	q É
(
É Ñ
value
Ñ â
)
â ä
;
ä ã
public 
static 
string 
TrimText %
(% &
this& *
string+ 1
value2 7
)7 8
=>9 ;
value< A
?A B
.B C
TrimC G
(G H
)H I
??J L
stringM S
.S T
EmptyT Y
;Y Z
public 
static 
bool 
	EqualText $
($ %
this% )
string* 0
textOne1 8
,8 9
string: @
textTwoA H
)H I
=>J L
textOneM T
.T U
EqualsU [
([ \
textTwo\ c
,c d
StringComparisone u
.u v
OrdinalIgnoreCase	v á
)
á à
;
à â
public 
static 
string 
ReplaceText (
(( )
this) -
string. 4
value5 :
,: ;
string< B
oldTextC J
,J K
stringL R
textReplaceS ^
,^ _
StringComparison` p

comparisonq {
=| }
StringComparison	~ é
.
é è
OrdinalIgnoreCase
è †
)
† °
{ 	
if 
( 
value 
. %
IsNullOrEmptyOrWhiteSpace /
(/ 0
)0 1
||2 4
oldText5 <
.< =%
IsNullOrEmptyOrWhiteSpace= V
(V W
)W X
)X Y
returnZ `
valuea f
??g i
stringj p
.p q
Emptyq v
;v w
return 
value 
? 
. 
Replace !
(! "
oldText" )
,) *
textReplace+ 6
,6 7

comparison8 B
)B C
;C D
} 	
public 
static 
bool 
ContainsText '
(' (
this( ,
string- 3
text4 8
,8 9
string: @
valueA F
)F G
=>H J
( 
string 
. 
IsNullOrEmpty !
(! "
text" &
)& '
&&( *
string+ 1
.1 2
IsNullOrEmpty2 ?
(? @
value@ E
)E F
)F G
|| 
text 
. 
Contains 
( 
value "
," #
StringComparison$ 4
.4 5
OrdinalIgnoreCase5 F
)F G
;G H
} 
}   