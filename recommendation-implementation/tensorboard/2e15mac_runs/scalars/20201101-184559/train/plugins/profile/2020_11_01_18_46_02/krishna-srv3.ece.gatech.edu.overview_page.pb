?	??:TSb@??:TSb@!??:TSb@	??????????????!???????"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6??:TSb@E??Ӝ<??1-&6???A????ߞ?I??d???
@Y	m9????*	????K?P@2F
Iterator::Model?2?FY???!?????6J@)????H???1F??t %E@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatO ????!????#&9@)4?IbI???1??O?y4@:Preprocessing2U
Iterator::Model::ParallelMapV2??	L?u{?!vY??G$@)??	L?u{?1vY??G$@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate???b?D??!:4?(?u,@)\??b??w?1?<!???!@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?]?pX??!]P?G@)*oG8-xq?1??bV??@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice?&P?"?m?!????@)?&P?"?m?1????@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?}:3Pi?!%*?L??@)?}:3Pi?1%*?L??@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?~m?????!?y??/@)?}?֤?R?1?-??????:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 15.6% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?69.6 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9???????>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	E??Ӝ<??E??Ӝ<??!E??Ӝ<??      ??!       "	-&6???-&6???!-&6???*      ??!       2	????ߞ?????ߞ?!????ߞ?:	??d???
@??d???
@!??d???
@B      ??!       J		m9????	m9????!	m9????R      ??!       Z		m9????	m9????!	m9????JGPUY???????b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogitsJ??n??!J??n??""
ArgMaxArgMax?n??i??!5???/???"$
ArgMax_1ArgMax?p?2#??!^??X???"7
sequential/dense_1/SoftmaxSoftmax????bk??!E??pY???"C
'gradient_tape/sequential/dense_1/MatMulMatMul${?!֮??!??!й??"5
sequential/dense_1/MatMulMatMul???.?ߕ?!??	+?h??".
IteratorGetNext/_13_Send?n%??)??!k?
??"A
%gradient_tape/sequential/dense/MatMulMatMulz^s$???!???I???"K
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdamO]?????!}^n????"3
sequential/dense/MatMulMatMulM???5??!Beu?k??Q      Y@Y?;?;H@aN??N??I@q=dj,C??y?y???"?

both?Your program is POTENTIALLY input-bound because 15.6% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?69.6 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 