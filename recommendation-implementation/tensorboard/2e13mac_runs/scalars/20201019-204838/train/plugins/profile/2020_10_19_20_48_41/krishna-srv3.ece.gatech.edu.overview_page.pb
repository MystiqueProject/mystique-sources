?	??????@??????@!??????@	?O??C???O??C??!?O??C??"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6??????@?l???1???&?+??A:?}?kϜ?I????@Y̲'??9??*	^?I?Y@2F
Iterator::Model?HK????!? ???M@)????????1wb?̍?E@:Preprocessing2U
Iterator::Model::ParallelMapV2X?<?????!?<Uk?0@)X?<?????1?<Uk?0@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??0??!o*y7Q2@)?xwd?6??1K?'A,?-@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::ConcatenateuV?1???!Ė:l??1@)?z????1?4$?`?,@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor@?J???l?!P^??
Y@)@?J???l?1P^??
Y@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice??DJ?yl?!??C??.@)??DJ?yl?1??C??.@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip ???WW??!
??~_D@)???߾l?1??????
@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap.=??????!?? ͩ3@)?k???V?1??e????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 0.0% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.high"?99.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9?O??C??#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	?l????l???!?l???      ??!       "	???&?+?????&?+??!???&?+??*      ??!       2	:?}?kϜ?:?}?kϜ?!:?}?kϜ?:	????@????@!????@B      ??!       J	̲'??9??̲'??9??!̲'??9??R      ??!       Z	̲'??9??̲'??9??!̲'??9??JGPUY?O??C??b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits??X??q??!??X??q??""
ArgMaxArgMax?Ll????!m???{,??"$
ArgMax_1ArgMax??f??!?zQ???"7
sequential/dense_1/SoftmaxSoftmax??:?^??!??PmH???".
IteratorGetNext/_13_Send?`?\?9??!?8X6??"C
'gradient_tape/sequential/dense_1/MatMulMatMulЩ???0??!??T????"3
sequential/dense/MatMulMatMul????us??!jAh,hQ??"5
sequential/dense_1/MatMulMatMul?6l????!??????"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul??+j?f??!??'???"A
%gradient_tape/sequential/dense/MatMulMatMulE?&iQ(??!!efm4???Q      Y@Y?????I@adp>?cH@q??????y?y?(`i'???"?

device?Your program is NOT input-bound because only 0.0% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?99.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 