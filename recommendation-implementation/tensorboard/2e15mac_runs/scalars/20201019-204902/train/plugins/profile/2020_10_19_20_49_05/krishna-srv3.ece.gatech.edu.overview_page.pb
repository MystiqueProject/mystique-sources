?	X?%??A@X?%??A@!X?%??A@	???^??????^???!???^???"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6X?%??A@$D??R??1???c[??A?x! ?I<g??@YRH2?w???*	k????ZV@2F
Iterator::Model`?U,~S??!L????J@)?p?-ޣ?1?
u??E@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate?^|?/??!U????
6@)RC????1?0:?2@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat6????t??!bϭ8R3@)`??9z??1
?.??/@:Preprocessing2U
Iterator::Model::ParallelMapV2$c??Ձ?!fz??y#@)$c??Ձ?1fz??y#@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip??аu??!?GW?nG@)p\?M4o?1??Y?	@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice???8m?!n?"?v?@)???8m?1n?"?v?@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor2?g@?i?!?j?$@)2?g@?i?1?j?$@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?E??ꎕ?! G?/?7@)?l???U?1??@#??:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 21.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?66.4 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9???^???>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	$D??R??$D??R??!$D??R??      ??!       "	???c[?????c[??!???c[??*      ??!       2	?x! ??x! ?!?x! ?:	<g??@<g??@!<g??@B      ??!       J	RH2?w???RH2?w???!RH2?w???R      ??!       Z	RH2?w???RH2?w???!RH2?w???JGPUY???^???b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits"L:^????!"L:^????""
ArgMaxArgMax?UMӉ???!?ІiiA??"$
ArgMax_1ArgMaxʝ>Lq??!|?꒯??"7
sequential/dense_1/SoftmaxSoftmax'Z?Ɲ?!???4ʝ??".
IteratorGetNext/_13_Send?5Y?u???!d????M??"C
'gradient_tape/sequential/dense_1/MatMulMatMulȘ?Ꮐ??!*??`????"3
sequential/dense/MatMulMatMul????m???!???g??"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul.?	K[n??!U???e???"C
'gradient_tape/sequential/dense/MatMul_1MatMul??d???!%??+!??"5
sequential/dense_1/MatMulMatMuls?;?????!????x??Q      Y@Y?????I@adp>?cH@q?bV?:???y??
?Ż??"?

both?Your program is POTENTIALLY input-bound because 21.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?66.4 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 