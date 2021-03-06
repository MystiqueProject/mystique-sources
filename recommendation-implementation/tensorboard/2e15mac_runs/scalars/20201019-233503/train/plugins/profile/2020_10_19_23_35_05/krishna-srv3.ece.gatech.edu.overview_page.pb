?	h?RD?@h?RD?@!h?RD?@	 ??l'@ ??l'@! ??l'@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6h?RD?@ qW?"???1zVҊo(??AF]k?SU??I???	?@Yst??%??*	)\????V@2F
Iterator::Model?%?????!s??15?G@)B|`????14?t?9?A@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap??`??
??!?I?8?8@)?`8?0C??1U???M?4@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeats???M??!???@2
8@)?3??k???1?C?x?84@:Preprocessing2U
Iterator::Model::ParallelMapV2/?.?H??!??G???'@)/?.?H??1??G???'@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip'???????!?9??hJ@)y=?o?1?@ ??@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice ?C??<n?!z??+?'@) ?C??<n?1z??+?'@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?{?l?!???A??@)?{?l?1???A??@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 10.1% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?75.6 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9 ??l'@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	 qW?"??? qW?"???! qW?"???      ??!       "	zVҊo(??zVҊo(??!zVҊo(??*      ??!       2	F]k?SU??F]k?SU??!F]k?SU??:	???	?@???	?@!???	?@B      ??!       J	st??%??st??%??!st??%??R      ??!       Z	st??%??st??%??!st??%??JGPUY ??l'@b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogitsm??1?m??!m??1?m??""
ArgMaxArgMax?$??-???!I?YU$+??"$
ArgMax_1ArgMax? 'gw??!??9:???"7
sequential/dense_1/SoftmaxSoftmax???|?)??!???^???".
IteratorGetNext/_13_Send????(.??!????<??"C
'gradient_tape/sequential/dense_1/MatMulMatMul??????!?ݝ????"3
sequential/dense/MatMulMatMul??a?????!煯`T??"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul???3?Ç?!?~Y.???"C
'gradient_tape/sequential/dense/MatMul_1MatMul?<s?????!???_]??"5
sequential/dense_1/MatMulMatMul??t?????!?}?e??Q      Y@Y?????jI@aUUUUU?H@q?]轂f??y??????"?

both?Your program is POTENTIALLY input-bound because 10.1% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?75.6 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 