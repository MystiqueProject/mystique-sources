
??	/host:CPU????Rpython??")?????՛"*notTraced-nonXla" "в??????"ؽ????ɸ"??????Ͷ"???????+"??????"????ȯ"??????"??????"??????"??????"??????"??????
"??????
"??????"??????	"??????"؆????
"??????
"??????"??????"??????"??????
"Ї????"??????"??????"??????
"輶???
"??????"??????"?ă????"????????"  "*0"=???????" ???»????" " "???»????"  "?å??˅	"kЖ??"*	GPU_0_bfc"  "	 ???"
 ????"?Ay;???" ???" " ?"
 ??????"  "  "???????"k?Ʉ?"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" " ?"
 ??Ͱ??"  "  "???????""??Ӆ??,"#ت???Ϥ;"??????"??ų??""???????)"!?????ў("?ŗ????"Ȩ????$"??????"??ʽȃ?""  " ???????"  " "?؉??"*	GPU_0_bfc"  "	 ???"
 ????"?Ay;???" ???" " ?"
 ??????"*
LogicalAnd"  "
*output" 
"*[]"  "#?Ģ????"&???????"%?õ??ϴ"??????."???????"  "$?֛????"  " "#ȣ?????"??Γ???"?ǂ???'"????З?"Ȧ????"??ɸ???"??????"??????? ")???????"(?????ۉ"?Ԑ???-"???????"  "'Ў?????"  " "?̺???L"????Ⱦ"????ت"???????"??????"???????"k????"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" " ?"
 ??????"  "  "??????"??Ɂ??"#??җ???%",Ȯџ?Ѻ"+Ȓ?????"?أ0"???????"  "*??У???"  " ?????python??"l????"*	GPU_0_bfc"  "	 ???"
 ????"DF?xװ?" ???" ?" ?"
 ??????"  "  "n????"*	GPU_0_bfc"  "	 ???"
 ?ϖ?"??o?Ԝ?" ???" ??" ??"
 ??????"  "  ?Λ??
tf_Compute/-1451602482??">????????" ???»????"  " "???»????"  "7??͹??צ"  "  "=???????" ???»????"  " "???»????"  "8???????"  "  "=????轾" ???»????"  " "???»????"  "9?ܓ????"  "  ":??р??)"  "  ";????؇c"  "  "<??ЃȎ?"  "  "=??????j"  "  ?????
tf_Compute/-1456464838??"=??ث?χ" ???»????"  " "???»????"  "D-??ϱ?;"*Adam/ReadVariableOp_1"*
Adam/add_1"  "  "=???????" ???»????"  " "???»????"  "R.???????""*Adam/Identity_5/ReadVariableOp"*Adam/Identity_5"  "  "=???????" ???»????"  " "???»????"  "/???????"  "  ?b?ٵ?
tf_Compute/-1532138337??"=???????F" ???»????"  " "???»????"  "R>д?????""*Adam/Identity_3/ReadVariableOp"*Adam/Identity_3"  "  "=???????" ???»????"  " "???»????"  "u????"*gpu_host_bfc"  "	 ???"	
 ?????"X?z50?" ???" " ?"
 ???ހ?"  "  "  "=?????ͽ" ???»????"  " "???»????"  "=???????" ???»????"  " "???»????"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??3cU??" ???" ?" ?"
 ??????"
*ArgMax" ???»????"
*output" 	"*[32]"  "7??׍???O" ??????⍝"  " "??????⍝"?А?????F"  "1@???????" ??????⍝" "??????⍝">ȵ??????" ???»????"  " "???»????"  "A?܌????"  "  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" ?`" ?`"
 ???ހ?")*%sequential/embedding/embedding_lookup" ???»????"
*output" "*	[32,3,32]"  "v????"*gpu_host_bfc"  "	 ???"	
 ?????"?????:@?" ???" ?" ?"
 ???ހ?"  "  "  "eB?׷???Ž")*%sequential/embedding/embedding_lookup"*sequential/flatten/Reshape"  "  "?І??"*	GPU_0_bfc"  "	 ???"
 ?Ş?"J???W??" ???" ?`" ?`"
 ??????"*SameWorkerRecvDone"  "*dynamic" "*	[32,3,32]"  ">?η?????" ???»????"  " "???»????"  "?????"*	GPU_0_bfc"  "	 ?ֿ"
 ?Ӛ?""p?????" ???" ??" ??"
 ??????"*sequential/dense/MatMul" ???»????"
*output" "*[32,256]"  "??Ò?"*	GPU_0_bfc"  "	 ???"
 ?Ә?"?C}???" ???" ??" ??"
 ??԰??";*7sequential/dropout/dropout/random_uniform/RandomUniform" ???»????"
*output" "*[32,256]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"
8c?,??" ???" ?@" ?@"
 ??ְ??"+*'sequential/dropout/dropout/GreaterEqual" ???»????"
*output" 
"*[32,256]"  "t????"*	GPU_0_bfc"  "	 ???"
 ????"pd?????" ???" ??" ??"
 ??԰??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"
8c?,??" ???" ??" ??"
 ??԰??"#*sequential/dropout/dropout/Cast" ???»????"
*output" "*[32,256]"  "r????"*	GPU_0_bfc"  "	 ???"
 ?Ә?"?C}???" ???" ?@" ?@"
 ??ְ??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ?Ӗ?"?ǃ??" ???" ??" ??"
 ??ְ??""*sequential/dropout/dropout/Mul" ???»????"
*output" "*[32,256]"  "??Ǌ?"*	GPU_0_bfc"  "	 ???"
 ????"??r????" ???" ??" ??"
 ??ذ??"*sequential/dense_1/MatMul" ???»????"
*output" "*[32,858]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??/??" ???" ?" ?"
 ??????">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"*temp" "
*[32,1]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"DF?xװ?" ???" ?" ?"
 ??????">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"
*output" "*[32]"  "??ݪ?"*	GPU_0_bfc"  "	 ???"
 ????"?妉?" ???" ??" ??"
 ??߰??">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"
*output" "*[32,858]"  "???ԍ"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" ??" ??"
 ??????">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"  "  "???ώ"*	GPU_0_bfc"  "	 ???"
 ????"0	????" ???" ?" ?"
 ??????">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" ?" ?"
 ??????">*:categorical_crossentropy/softmax_cross_entropy_with_logits" ???»????"  "  "t????"*	GPU_0_bfc"  "	 ???"
 ????"?妉?" ???" ??" ??"
 ??Ͱ??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" ??" ??"
 ??Ͱ??"*sequential/dense_1/Softmax" ???»????"*temp" "*[32,858]"  "???ֳ"*	GPU_0_bfc"  "	 ???"
 ????"?O"GԲ?>" ???" ??" ??"
 ??????"*sequential/dense_1/Softmax" ???»????"*temp" "*[32,858]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??????" ???" ??" ??"
 ??????"*sequential/dense_1/Softmax" ???»????"  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"?妉?" ???" ??" ??"
 ??Ͱ??"*sequential/dense_1/Softmax" ???»????"  "  "??͇?"*gpu_host_bfc"  "	 ???"	
 ?????"	?v???" ???" " ?"
 ???ހ?"7*3categorical_crossentropy/weighted_loss/num_elements" ???»????"
*output" "*[]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"?|?-???" ???" " ?"
 ??????".**categorical_crossentropy/weighted_loss/Sum" ???»????"*temp" "*[]"  "r????"*	GPU_0_bfc"  "	 ???"
 ????"?妉?" ???" ?" ?"
 ??????"  "  "  "?Ќ??"*	GPU_0_bfc"  "	 ???"
 ????"?|?-???" ???" ?" ?"
 ??????"*ArgMax_1" ???»????"
*output" 	"*[32]"  "tج??"*	GPU_0_bfc"  "	 ???"
 ????"0?Ȝ???" ???" ??" ??"
 ??ذ??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"~??*??" ???"  " ?"
 ??????"	*Equal" ???»????"
*output" 
"*[32]"  "r????"*	GPU_0_bfc"  "	 ???"
 ????"0?Ȝ???" ???" ?" ?"
 ??????"  "  "  "r????"*	GPU_0_bfc"  "	 ???"
 ????"DF?xװ?" ???" ?" ?"
 ??????"  "  "  "?д??"*	GPU_0_bfc"  "	 ???"
 ????"0?Ȝ???" ???" " ?"
 ??????"*SameWorkerRecvDone"  "*dynamic" "*[]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"~??*??" ???" ?" ?"
 ??????"
*Cast_1" ???»????"
*output" "*[32]"  "q??΄"*	GPU_0_bfc"  "	 ???"
 ????"0?Ȝ???" ???"  " ?"
 ??????"  "  "  "???Ň"*gpu_host_bfc"  "	 ???"	
 ?????"?`p????" ???" " ?"
 ???ހ?"*Size" ???»????"
*output" "*[]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"~??*??" ???" " ?"
 ??????"	*Sum_2" ???»????"*temp" "*[]"  "r??ڏ"*	GPU_0_bfc"  "	 ???"
 ????"0?Ȝ???" ???" ?" ?"
 ??????"  "  "  "q??"*	GPU_0_bfc"  "	 ???"
 ????"??/??" ???" " ?"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"DF?xװ?" ???" " ?"
 ??????"*SameWorkerRecvDone"  "*dynamic" "*[]"  ">??ͼ؊??" ???»????"  " "???»????"  "?????"*	GPU_0_bfc"  "	 ???"
 ?͖?"?՜}??" ???" " ?"
 ??????"<*8categorical_crossentropy/weighted_loss/num_elements/Cast" ???»????"
*output" "*[]"  "q????"*	GPU_0_bfc"  "	 ???"
 ?ϖ?"??o?Ԝ?" ???" " ?"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ?˖?"??/'??" ???" " ?"
 ??????"I*Egradient_tape/categorical_crossentropy/weighted_loss/value/div_no_nan" ???»????"
*output" "*[]"  "q? ?"*	GPU_0_bfc"  "	 ???"
 ?͖?"?՜}??" ???" " ?"
 ??????"  "  "  "?ش??"*	GPU_0_bfc"  "	 ???"
 ?͖?"?՜}??" ???" ?" ?"
 ??????"?*;gradient_tape/categorical_crossentropy/weighted_loss/Tile_1" ???»????"
*output" "*[32]"  "q?׳?"*	GPU_0_bfc"  "	 ???"
 ?і?"CUB3,??" ???" " ?"
 ??????"  "  "  "q????"*	GPU_0_bfc"  "	 ???"
 ?і?"CUB3,??" ???" " ?"
 ??????"  "  "  "q?赍"*	GPU_0_bfc"  "	 ???"
 ?Ӗ?"?ǃ??" ???" " ?"
 ??????"  "  "  "r????"*	GPU_0_bfc"  "	 ???"
 ?Ֆ?"	??٣?" ???" ?" ?"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ?Ք?"????Kx?" ???" ??" ??"
 ??Ͱ??"+*'gradient_tape/sequential/dense_1/MatMul" ???»????"
*output" "*[32,256]"  "???Ų"*	GPU_0_bfc"  "	 ???"
 ??߫"wʆX?x?" ???" ??5" ??5"
 ??????"-*)gradient_tape/sequential/dense_1/MatMul_1" ???»????"
*output" "*	[256,858]"  "t?㙾"*	GPU_0_bfc"  "	 ???"
 ????"??·???" ???" ??" ??"
 ??ְ??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"h?ɾ??" ???" ?" ?"
 ??ϰ??"8*4gradient_tape/sequential/dense_1/BiasAdd/BiasAddGrad" ???»????"
*output" "	*[858]"  "t????"*	GPU_0_bfc"  "	 ???"
 ????"?????o?" ???" ??" ??"
 ??߰??"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"Fֹi|m?" ???" " ?"
 ??????"*
div_no_nan" ???»????"
*output" "*[]"  "t荭?"*	GPU_0_bfc"  "	 ???"
 ????"??b ?l?" ???" ??5" ??5"
 ??????"  "  "  "r????"*	GPU_0_bfc"  "	 ???"
 ????".p?Vx??" ???" ?" ?"
 ??ϰ??"  "  "  "t????"*	GPU_0_bfc"  "	 ???"
 ????"X?K???" ???" ??" ??"
 ??԰??"  "  "  "t????"*	GPU_0_bfc"  "	 ???"
 ????"??&}???" ???" ??" ??"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??Jc`??" ???" ?`" ?`"
 ??????")*%gradient_tape/sequential/dense/MatMul" ???»????"
*output" "*[32,96]"  "??Ǜ?"*	GPU_0_bfc"  "	 ???"
 ????"2|Y??" ???" ??" ??"
 ??ϰ??"+*'gradient_tape/sequential/dense/MatMul_1" ???»????"
*output" "*[96,256]"  "r????"*	GPU_0_bfc"  "	 ???"
 ????"?-??}?" ???" ?`" ?`"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"b,$?s?" ???" ?" ?"
 ??????"6*2gradient_tape/sequential/dense/BiasAdd/BiasAddGrad" ???»????"
*output" "	*[256]"  "t????"*	GPU_0_bfc"  "	 ???"
 ????"go?=??" ???" ??" ??"
 ??Ͱ??"  "  "  "t??ة"*	GPU_0_bfc"  "	 ???"
 ????"??C>?!?" ???" ??" ??"
 ??ϰ??"  "  "  "q????"*	GPU_0_bfc"  "	 ???"
 ????"????>$?" ???" " ?"
 ??????"  "  "  "q??̱"*	GPU_0_bfc"  "	 ???"
 ????"Gi?՗&?" ???" " ?"
 ??????"  "  "  "r????"*	GPU_0_bfc"  "	 ???"
 ????"^v???/?" ???" ?" ?"
 ??????"  "  "  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"Ѳ????" ???" ?`" ?`"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "*[96,32]"  ">?д?????" ???»????"  " "???»????"  "Cз??؉?"  "  "v????"*gpu_host_bfc"  "	 ???"	
 ?????"W?}W???" ???" ?`" ?`"
 ???ހ?"  "  "  "D???????"  "  "E???????"  "  "F???????"  "  "G????،??"  "  "H???????B"  "  "I??̪???9"  "  "J???????U"  "  "K?ᇽ???x"  "  "??쟿"*gpu_host_bfc"  "	 ???"	
 ?????"-Ȃ0?" ???" ??N" ??c"
 ??????"(*$Adam/Adam/update/AssignSubVariableOp" ???»????"*persist" "*
[10001,32]"  "y??ل"*gpu_host_bfc"  "	 ???"	
 ?????"!?bG?P??" ???" ??N" ???"
 ??????"  "  "  "XL????Ș?"(*$Adam/Adam/update/AssignSubVariableOp"*Adam/Adam/Const"  "  "7@???????" ???»????" "???»????"  "=???????" ???»????"  " "???»????"  "7@ذ?????" ???»????" "???»????"  ?
?Ś?	tf_Compute/-1727618428??">?݁?????" ???»????"  " "???»????"  "??۽?"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "*[]"  "?Ї??"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" 	"*[]"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"??3cU??" ???" " ?"
 ??????"*Adam/add" ???»????"
*output" 	"*[]"  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "*[]"  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "*[]"  "??ى?"*	GPU_0_bfc"  "	 ???"
 ????"S\?ˢ??" ???" " ?"
 ??????"*	Adam/Cast" ???»????"
*output" "*[]"  "q????"*	GPU_0_bfc"  "	 ???"
 ????"?????" ???" " ?"
 ??????"  "  "  "???"*	GPU_0_bfc"  "	 ???"
 ????"S\?ˢ??" ???" " ?"
 ??????"*Adam/Pow" ???»????"
*output" "*[]"  ?
ު??tf_Compute/-2071571106??"=??Ӿ???O" ???»????"  " "???»????"  "M?Á??ҽ;"  "  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"E*Agradient_tape/sequential/embedding/embedding_lookup/VariableShape" ???»????"
*output" "*[2]"  "?N?ٯ????"E*Agradient_tape/sequential/embedding/embedding_lookup/VariableShape"E*Agradient_tape/sequential/embedding/embedding_lookup/strided_slice"  "  "=???????b" ???»????"  " "???»????"  "CO?淪???^"*IteratorGetNext"*sequential/Cast"  "  "?????"*	GPU_0_bfc"  "	 ???"
 ????"?7????" ???" ?" ?"
 ??????"*SameWorkerRecvDone"  "*dynamic" 	"
*[32,3]"  "=???????," ???»????"  " "???»????"  "??ݖ?"*	GPU_0_bfc"  "	 ???"
 ????"?Q?I??" ???" " ?"
 ??????"*Cast" ???»????"
*output" "*[]"  "qȉӨ"*	GPU_0_bfc"  "	 ???"
 ????"A?Ԯ???" ???" " ?"
 ??????"  "  "  "=???????" ???»????"  " "???»????"  "P???????"  "  "Q???????"  "  "=???????" ???»????"  " "???»????"  "R???????"  "  ?
????tf_Compute/-2140760704??"=??ھ???-" ???»????"  " "???»????"  "????????"?*;gradient_tape/sequential/embedding/embedding_lookup/Reshape"'*#Adam/Adam/update/UnsortedSegmentSum"  "  "=?????ƛ%" ???»????"  " "???»????"  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"F*Bcategorical_crossentropy/softmax_cross_entropy_with_logits/Shape_2" ???»????"
*output" "*[2]"  "t	???????"F*Bcategorical_crossentropy/softmax_cross_entropy_with_logits/Shape_2"*strided_slice"  "  "=ȍ?????A" ???»????"  " "???»????"  "?Ș??"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" " ?"
 ???ހ?"*strided_slice" ???»????"
*output" "*[]"  "u????"*gpu_host_bfc"  "	 ???"	
 ?????"?]O0?" ???" " ?"
 ???ހ?"  "  "  "?Ȑ??"*	GPU_0_bfc"  "	 ???"
 ????"A?Ԯ???" ???" " ?"
 ??????"*SameWorkerRecvDone"  "*dynamic" "*[]"  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"??k?@?" ???" " ?"
 ???ހ?"*	RecvAsync"  "  "  "7???????" ??????⍝"  " "??????⍝"
???????"  ?Ҷ??tf_Compute/-349775022??"=Ȑ??غ?;" ???»????"  " "???»????"  "R?萿???0""*Adam/Identity_4/ReadVariableOp"*Adam/Identity_4"  "  "=???????G" ???»????"  " "???»????"  ":????C"*IteratorGetNext"
*ArgMax"  "  "?ȇ£"*	GPU_0_bfc"  "	 ???"
 ????"jii????" ???" ??" ??"
 ??Ͱ??"*SameWorkerRecvDone"  "*dynamic" "*[32,858]"  ">????????" ???»????"  " "???»????"  "?????"*	GPU_0_bfc"  "	 ???"
 ????"S\?ˢ??" ???" ?" ?"
 ??????"*sequential/Cast" ???»????"
*output" "
*[32,3]"  "r????"*	GPU_0_bfc"  "	 ???"
 ????"??3cU??" ???" ?" ?"
 ??????"  "  "  "???ʷ"*	GPU_0_bfc"  "	 ???"
 ????"?Q?I??" ???" ?" ?"
 ??????"*sequential/embedding/Cast" ???»????"
*output" "
*[32,3]"  "r????"*	GPU_0_bfc"  "	 ???"
 ????"?????" ???" ?" ?"
 ??????"  "  "  "?ș??"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" ?" ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "
*[32,3]"  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"  " ???" ?" ?"
 ???ހ?"*SameWorkerRecvDone"  "*dynamic" "
*[32,3]"  "=???????" ???»????"  " "???»????"  ">??Ҋ????" ???»????"  " "???»????"  "??͋Ю??"  "  "vЧ??"*gpu_host_bfc"  "	 ???"	
 ?????"j?????" ???" ?" ?"
 ???ހ?"  "  "  "???????"  "  ?饜?tf_Compute/-632876311??"=??޸???" ???»????"  " "???»????"  "cS????膡"*sequential/embedding/Cast")*%sequential/embedding/embedding_lookup"  "  ">????????
" ???»????"  " "???»????"  "T????????"  "  "U?????ز>"  "  "u????"*gpu_host_bfc"  "	 ???"	
 ?ޱ??":A?>???" ???" " ?"
 ???ހ?"  "  "  "V???????Z"  "  "???ф"*gpu_host_bfc"  "	 ???"	
 ?????"W?}W???" ???" ??N" ??N"
 ??????"'*#Adam/Adam/update/AssignVariableOp_1" ???»????"*persist" "*
[10001,32]"  "=?????дM" ???»????"  " "???»????"  "?????"*	GPU_0_bfc"  "	 ???"
 ?͖?"?՜}??" ???" " ?"
 ??????"
*Cast_2" ???»????"
*output" "*[]"  "q????"*	GPU_0_bfc"  "	 ???"
 ?ϖ?"??o?Ԝ?" ???" " ?"
 ??????"  "  "  "qئ??"*	GPU_0_bfc"  "	 ???"
 ?ϖ?"??o?Ԝ?" ???" " ?"
 ??????"  "  "  "?????"*	GPU_0_bfc"  "	 ???"
 ?ϖ?"??o?Ԝ?" ???" " ?"
 ??????"*div_no_nan_1" ???»????"
*output" "*[]"  ">????ȇ??" ???»????"  " "???»????"  "W????褗"  "  "X???????	"  "  "Y?????혏"  "  "Z???????7"  "  "u????"*gpu_host_bfc"  "	 ???"	
 ?????"?B?????" ???" " ?"
 ???ހ?"  "  "  ?????tf_Compute/-679981713??"=???????4" ???»????"  " "???»????"  "y????ؗ?"A*=gradient_tape/sequential/embedding/embedding_lookup/Reshape_1"*Adam/Adam/update/Unique"  "  "=?囦???" ???»????"  " "???»????"  "?ہ????"  "  "?????߆"  "  "u????"*gpu_host_bfc"  "	 ???"	
 ?????"X?z50?" ???" " ?"
 ???ހ?"  "  "  ">????????" ???»????"  " "???»????"  "???????@"  "  "u??ݮ"*gpu_host_bfc"  "	 ???"	
 ?????"??Ϩ?VH?" ???" " ?"
 ???ހ?"  "  "  "????躃?"  "  "?????"*gpu_host_bfc"  "	 ???"	
 ?????"??????" ???" ??N" ??N"
 ??????"%*!Adam/Adam/update/AssignVariableOp" ???»????"*persist" "*
[10001,32]"  ?????tf_GPU_Event_Manager/-4798602??"l????"*	GPU_0_bfc"  "	 ???"
 ????"A?Ԯ???" ???" ?" ?"
 ??????"  "  "p????"*gpu_host_bfc"  "	 ???"	
 ?ܱ??"࠽?x???" ???" ?`" ?`"
 ???ހ?"  "  "o蠱?"*gpu_host_bfc"  "	 ???"	
 ?????"	?v???" ???" " ?"
 ???ހ?"  "  "oȅ??"*gpu_host_bfc"  "	 ???"	
 ?????"W?}W???" ???" " ?"
 ???ހ?"  "  "l????"*	GPU_0_bfc"  "	 ???"
 ????"U???B??" ???" ?`" ?`"
 ??????"  "  ?????$tf_data_iterator_get_next/1227387674??"(???????)" ???»????"  "  "!???????" 伯?????x"  "I???????" ㋤?????" 伯?????x"*true"*true" @"  ?????%tf_data_iterator_resource/-1918643814??")5????؋?-" ??????Ӣ" ㋤?????"*2???????" ???????ԋ" ??????Ӣ"+1؄?????" ?????????" ???????ԋ"+0?????п" ???Њ?ѳ?" ?????????")4???????" ?????䲕a" ??????Ӣ")3?ݒ???:" ?????????" ?????䲕a"*3???????" ?????????" ?????䲕a"6???????" ??????⍝"(H$HAdam/Adam/update/Sqrt:Sqrt"Sqrt")I%IAdam/Adam/update/add:AddV2"AddV2"1J-J Adam/Adam/update/truediv:RealDiv"RealDiv"UKQK8Adam/Adam/update/AssignSubVariableOp:AssignSubVariableOp"AssignSubVariableOp"=L9L.Adam/Adam/update/AssignSubVariableOp/_34:_Send"_Send"fMbMOgradient_tape/sequential/embedding/embedding_lookup/VariableShape:VariableShape"VariableShape"YNUNJgradient_tape/sequential/embedding/embedding_lookup/VariableShape/_9:_Send"_Send"(O$OIteratorGetNext/_11:_Send"_Send"PPAdam/Pow_2:Pow"Pow"QQAdam/sub_5:Sub"Sub"RRAdam/sub_7:Sub"Sub"2S.S#sequential/embedding/Cast/_20:_Recv"_Recv"HTDT0Adam/Adam/update/ReadVariableOp_2:ReadVariableOp"ReadVariableOp"'U#UAdam/Adam/update/mul_4:Mul"Mul"NVJV4Adam/Adam/update/AssignVariableOp_1:AssignVariableOp"AssignVariableOp"%W!WAdam/Adam/update/mul:Mul"Mul"RXNX6Adam/Adam/update/ResourceScatterAdd:ResourceScatterAdd"ResourceScatterAdd"HYDY0Adam/Adam/update/ReadVariableOp_1:ReadVariableOp"ReadVariableOp"'Z#ZAdam/Adam/update/mul_5:Mul"Mul"62'Adam/Identity_4/ReadVariableOp/_6:_Recv"_Recv"ExecutorState::Process"MemoryAllocation"($IteratorGetNext/_13:_Send"_Send"MemoryDeallocation".*Adam/Adam/update/Unique:Unique"Unique"A=+Adam/Adam/update/strided_slice:StridedSlice"StridedSlice"TPEgradient_tape/sequential/embedding/embedding_lookup/Reshape/_32:_Recv"_Recv"c	_	Pcategorical_crossentropy/softmax_cross_entropy_with_logits/Shape_2/_15:_HostSend"	_HostSend"#

GatherV2:GatherV2"GatherV2"?;Iterator::Model::ParallelMapV2"Iterator::ParallelMapV2"Iterator::Model"$ IteratorGetNextOp::DoCompute"VRGgradient_tape/sequential/embedding/embedding_lookup/Reshape_1/_26:_Recv"_Recv"Adam/add_1:AddV2"AddV2"Adam/Cast_1:Cast"Cast"'#Adam/Adam/update/mul_1:Mul"Mul"LH2Adam/Adam/update/AssignVariableOp:AssignVariableOp"AssignVariableOp"51-TensorHandle::GetResourceHandleInfo WaitReady"'#EagerCopyToDeviceAndAddCacheKey"%!ValidateInputTypeAndPlacement"FunctionRun"EagerKernelExecute"951EagerLocalExecute: __inference_train_function_859"40,EagerExecute: __inference_train_function_859" TFE_Py_ExecuteCancelable"train_function"TFE_DeleteTensorHandle"tf.constant"wso_Send input 0 from /job:localhost/replica:0/task:0/device:CPU:0 to /job:localhost/replica:0/task:0/device:GPU:0"wso_Send input 1 from /job:localhost/replica:0/task:0/device:CPU:0 to /job:localhost/replica:0/task:0/device:GPU:0") % LogicalAnd:LogicalAnd"
LogicalAnd"%!!!EagerLocalExecute: LogicalAnd" ""EagerExecute: LogicalAnd" ##TFE_Py_FastPathExecute_C"#$$Identity:Identity"Identity"#%%EagerLocalExecute: Identity"&&EagerExecute: Identity"/'+'WriteSummary:WriteSummary"WriteSummary"'(#(EagerLocalExecute: WriteSummary""))EagerExecute: WriteSummary"A*=*%FlushSummaryWriter:FlushSummaryWriter"FlushSummaryWriter"-+)+%EagerLocalExecute: FlushSummaryWriter"(,$, EagerExecute: FlushSummaryWriter"--)-Adam/ReadVariableOp_1/_2:_Recv"_Recv"6.2.'Adam/Identity_5/ReadVariableOp/_8:_Recv"_Recv"8/4/IteratorGetNext:IteratorGetNext"IteratorGetNext"n0j0OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice"Iterator::TensorSlice"^1Z1?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate"Iterator::Concatenate"J2F2/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap"Iterator::FlatMap"_3[3AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor"Iterator::FromTensor"V4R45Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat"Iterator::ForeverRepeat":565#Iterator::Model::ParallelMapV2::Zip"Iterator::Zip".6*6&InstantiatedCapturedFunction::RunAsync"F7B7.Adam/Adam/update/ReadVariableOp:ReadVariableOp"ReadVariableOp"88Adam/sub_6:Sub"Sub"99Adam/Pow_3:Pow"Pow"::Adam/sub_4:Sub"Sub";;Adam/Sqrt_1:Sqrt"Sqrt"'<#<Adam/truediv_1:RealDiv"RealDiv"==Adam/mul_1:Mul"Mul"6>2>'Adam/Identity_3/ReadVariableOp/_4:_Recv"_Recv"%?!?GatherV2_1:GatherV2"GatherV2"@@ExecutorDoneCallback"LAHA4sequential/embedding/embedding_lookup:ResourceGather"ResourceGather">B:B/sequential/embedding/embedding_lookup/_23:_Send"_Send"RCNC6Adam/Adam/update/UnsortedSegmentSum:UnsortedSegmentSum"UnsortedSegmentSum"'D#DAdam/Adam/update/mul_2:Mul"Mul"'E#EAdam/Adam/update/mul_3:Mul"Mul"TFPF8Adam/Adam/update/ResourceScatterAdd_1:ResourceScatterAdd"ResourceScatterAdd"HGDG0Adam/Adam/update/ReadVariableOp_3:ReadVariableOp"ReadVariableOp*	parent_id*autotune*deterministic*parallelism*
_r*_pt*
_p*tf_function_call*tracing_count*group_id*	step_name*is_eager*from*
to*
id*iter_num*_ct*
_c*allocator_name*bytes_reserved*		bytes_allocated*

bytes_available*fragmentation*peak_bytes_in_use*requested_bytes*allocation_bytes*addr*	tf_op*region_type*	data_type*	shape
?/device:GPU:0*compute_cap_minor*group_id*	step_name*		is_eager*
clock_rate*
core_count*memory_bandwidth*memory_size*compute_cap_major2 ??b2 $2	??ȕ?2????2 2 Eairchitect: Failed to load libcupti (is it installed and accessible?)