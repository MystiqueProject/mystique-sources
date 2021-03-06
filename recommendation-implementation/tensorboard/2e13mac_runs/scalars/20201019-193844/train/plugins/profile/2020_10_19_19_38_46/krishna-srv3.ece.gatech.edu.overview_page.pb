?	?	?8t@?	?8t@!?	?8t@	????y@????y@!????y@"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6?	?8t@Tȕz???12>?^???A?ɩ?aj??I:]??@Y%"???1??*	+???U@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatÝ#????!Z?.???@@)}??z?V??1??G?85;@:Preprocessing2F
Iterator::Model???n,(??!?k?rz?@)%?}?e???10?	r?37@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate?Ѫ?t???!??Vvj?5@)?}V?)???1`J! ??1@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?W?L????! eY?!Q@)<1??PN??1? 1F0?&@:Preprocessing2U
Iterator::Model::ParallelMapV2?	?y?}?!??!V? @)?	?y?}?1??!V? @:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??fHu?!J;X4??@)??fHu?1J;X4??@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice???O??m?!L??X9?@)???O??m?1L??X9?@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapyY|??!L?Q}8@)~t??gy^?1?<?ܖ@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 13.3% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?71.4 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9????y@>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	Tȕz???Tȕz???!Tȕz???      ??!       "	2>?^???2>?^???!2>?^???*      ??!       2	?ɩ?aj???ɩ?aj??!?ɩ?aj??:	:]??@:]??@!:]??@B      ??!       J	%"???1??%"???1??!%"???1??R      ??!       Z	%"???1??%"???1??!%"???1??JGPUY????y@b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits0&?????!0&?????""
ArgMaxArgMax????????!*J??S??"$
ArgMax_1ArgMax϶??Č??!??,????"7
sequential/dense_1/SoftmaxSoftmaxHK?P???!^??X???".
IteratorGetNext/_13_Send?Z?+?/??!6?y??c??"C
'gradient_tape/sequential/dense_1/MatMulMatMuld?O???!vtӇ??"3
sequential/dense/MatMulMatMul??????!E??o??"5
sequential/dense_1/MatMulMatMulرv?r??!ebz:???"A
%gradient_tape/sequential/dense/MatMulMatMulf??n:և?!d?@??"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul???????!v??7k???Q      Y@Y?????I@adp>?cH@q??n!????yGK?y?>??"?

both?Your program is POTENTIALLY input-bound because 13.3% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?71.4 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 