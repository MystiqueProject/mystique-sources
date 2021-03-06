?	y??M?@y??M?@!y??M?@	?)??v@?)??v@!?)??v@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6y??M?@<?b??*??1?^Ӄ?R??A+?m????I%xC8@Y?y?t??*	y?&1?R@2F
Iterator::Model?E?2ɠ?!??Y?P?E@)˞6????1?:?M?@@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat3??????!?"??#?@)?Ƽ?8d??1M?^̪/9@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?ѯ????!??2?3@)??6?4D??11,???+@:Preprocessing2U
Iterator::Model::ParallelMapV2??????~?!?7??#@)??????~?1?7??#@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice??4???r?!?^(?N@)??4???r?1?^(?N@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??X?yVr?!?;P?@)??X?yVr?1?;P?@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?+??ص??!??2L@)RC??p?1[????x@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 13.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?68.2 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9?)??v@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	<?b??*??<?b??*??!<?b??*??      ??!       "	?^Ӄ?R???^Ӄ?R??!?^Ӄ?R??*      ??!       2	+?m????+?m????!+?m????:	%xC8@%xC8@!%xC8@B      ??!       J	?y?t???y?t??!?y?t??R      ??!       Z	?y?t???y?t??!?y?t??JGPUY?)??v@b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits,m-????!,m-????""
ArgMaxArgMax?N????!?+?nj??"$
ArgMax_1ArgMax}]???!???bJl??"7
sequential/dense_1/SoftmaxSoftmax5c??@??!?C?j?T??"C
'gradient_tape/sequential/dense_1/MatMulMatMul?_???{??!???(???"5
sequential/dense_1/MatMulMatMul'e??0H??!?)լ????"K
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdam?0?;?s??!L;?F?~??".
IteratorGetNext/_13_Send?V?????!6??]'??"A
%gradient_tape/sequential/dense/MatMulMatMulcZ??i???!???CQ???"3
sequential/dense/MatMulMatMul?I???I??!??n?x)??Q      Y@Y?????jI@aUUUUU?H@q%?$]???y??`%5r??"?

both?Your program is POTENTIALLY input-bound because 13.8% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?68.2 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 