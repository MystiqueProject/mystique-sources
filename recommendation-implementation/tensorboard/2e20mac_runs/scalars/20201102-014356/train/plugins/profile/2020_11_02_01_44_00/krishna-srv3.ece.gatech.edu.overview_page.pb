?	W=`2?@W=`2?@!W=`2?@	?Numb@?Numb@!?Numb@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6W=`2?@b/????1$	?P(??AU????y??I???=?~
@Y??{???*	V-?S@2F
Iterator::Model'??2???!T?_ J@)E?>?'I??1ǩ?-t =@:Preprocessing2U
Iterator::Model::ParallelMapV2
??$>w??!:?&???6@)
??$>w??1:?&???6@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatE7????!??$???5@)#??E????1?????1@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?M?t"??!u??5W5@)C,cC7??1??gi??0@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip??M?E??!??x???G@)?h????n?1?W???@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice???k?6l?!J???đ@)???k?6l?1J???đ@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?e??
j?!?˃ɯ7@)?e??
j?1?˃ɯ7@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 14.3% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?70.3 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9?Numb@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	b/????b/????!b/????      ??!       "	$	?P(??$	?P(??!$	?P(??*      ??!       2	U????y??U????y??!U????y??:	???=?~
@???=?~
@!???=?~
@B      ??!       J	??{?????{???!??{???R      ??!       Z	??{?????{???!??{???JGPUY?Numb@b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits쓭?'??!쓭?'??""
ArgMaxArgMax??\[F9??!$Ą?????"$
ArgMax_1ArgMax?^???ǹ?!?-٩????"7
sequential/dense_1/SoftmaxSoftmax?w?ׂ??!?Q?b?g??"C
'gradient_tape/sequential/dense_1/MatMulMatMul??tT̗??!??QŻ4??"5
sequential/dense_1/MatMulMatMul??????!??f????".
IteratorGetNext/_13_Sendu???X??!??:????"A
%gradient_tape/sequential/dense/MatMulMatMul????Ce??!???V?6??"K
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdam?L{@???!?evW????"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul9???Xa??!wM??B:??Q      Y@Y?????jI@aUUUUU?H@q?'????yB? ?̄??"?

both?Your program is POTENTIALLY input-bound because 14.3% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?70.3 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 