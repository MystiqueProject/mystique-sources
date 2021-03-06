?	?_?n?@?_?n?@!?_?n?@	\ʭ?????\ʭ?????!\ʭ?????"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6?_?n?@???a????1?Z}uU ??A?????֟?IG?ҿ$@Y?mR?X??*	??(\??S@2F
Iterator::Modelh?,{??!??Ө??M@)Ֆ:?????1??ΐI@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatB_z?sѐ?!?y?轶4@)K?|%???1??G??0@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate??	m9??!????,@)?Z'.?+??1?e?ݰ?#@:Preprocessing2U
Iterator::Model::ParallelMapV2??c${?z?!?3+vT @)??c${?z?1?3+vT @:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zipl??7???!eu,WZD@)IJzZ?l?1~vzg?@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice???k?6l?!??N?_@)???k?6l?1??N?_@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor???E_Aj?!(??"+@)???E_Aj?1(??"+@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?lw?N??!?Q?K+/@)-?\o??P?1??ޑ????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 12.6% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?74.0 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9[ʭ?????>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	???a???????a????!???a????      ??!       "	?Z}uU ???Z}uU ??!?Z}uU ??*      ??!       2	?????֟??????֟?!?????֟?:	G?ҿ$@G?ҿ$@!G?ҿ$@B      ??!       J	?mR?X???mR?X??!?mR?X??R      ??!       Z	?mR?X???mR?X??!?mR?X??JGPUY[ʭ?????b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits?3????!?3????"$
ArgMax_1ArgMax?==T???!æ?L??""
ArgMaxArgMaxkE?????!$T?Q????"7
sequential/dense_1/SoftmaxSoftmax?n4o???!??a?ʴ??".
IteratorGetNext/_13_Send???i???!?>???j??"C
'gradient_tape/sequential/dense_1/MatMulMatMul???㝔?!??L????"3
sequential/dense/MatMulMatMul?To	?l??!??rao???"E
)gradient_tape/sequential/dense_1/MatMul_1MatMuluk??ɇ?!?N?ۖ???"C
'gradient_tape/sequential/dense/MatMul_1MatMul??ܧVr??!:6`:??"5
sequential/dense_1/MatMulMatMulƄ 0օ?!R??????Q      Y@Y?????I@adp>?cH@q?7j?1???y????????"?

both?Your program is POTENTIALLY input-bound because 12.6% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?74.0 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 