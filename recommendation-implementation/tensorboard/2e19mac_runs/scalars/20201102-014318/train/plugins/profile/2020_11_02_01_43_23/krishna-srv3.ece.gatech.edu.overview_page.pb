?	?QcBLt?@?QcBLt?@!?QcBLt?@	O?6ʯτ?O?6ʯτ?!O?6ʯτ?"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6?QcBLt?@?y????1Xp?????Aj??h???I??T;j?@YB?4-???*	??(\?jT@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatl\??Ϝ?!@?`3?9A@)O?s?L??1?%=@:Preprocessing2F
Iterator::Model??????!d ?+C@)???ih??1"??m?;@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap?ŧ ϐ?!???{?4@)dϞ??$??1????!?,@:Preprocessing2U
Iterator::Model::ParallelMapV2g?lt?O??!???"??$@)g?lt?O??1???"??$@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?r??ǩ?!??|=a?N@)?????w?1XÕafl@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice?wak??r?!??hQ??@)?wak??r?1??hQ??@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor	?/?
r?!??p~q?@)	?/?
r?1??p~q?@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 0.0% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.high"?99.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9O?6ʯτ?#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	?y?????y????!?y????      ??!       "	Xp?????Xp?????!Xp?????*      ??!       2	j??h???j??h???!j??h???:	??T;j?@??T;j?@!??T;j?@B      ??!       J	B?4-???B?4-???!B?4-???R      ??!       Z	B?4-???B?4-???!B?4-???JGPUYO?6ʯτ?b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits??=??!??=??""
ArgMaxArgMaxB??띹??!?n?ut???"$
ArgMax_1ArgMax9?MΩ!??!}??t????"7
sequential/dense_1/SoftmaxSoftmax??Z?ꢚ?!???????"C
'gradient_tape/sequential/dense_1/MatMulMatMul4??K?~??!?@??R??"5
sequential/dense_1/MatMulMatMul???????!kQ??
	??".
IteratorGetNext/_13_Send?|˵?1??!Q?nϙ???"K
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdamq???ꇒ?!?#$?F??"A
%gradient_tape/sequential/dense/MatMulMatMul򂶆a???!??X0????"3
sequential/dense/MatMulMatMul???{???!???=??Q      Y@Y?????jI@aUUUUU?H@qg_e?1q?y<???p???"?

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