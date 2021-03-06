?	?C?b?@?C?b?@!?C?b?@	??ȿ?I????ȿ?I??!??ȿ?I??"w
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails6?C?b?@????????1S%??RN??Au???IZ?!?[=
@Y_?;???*	?????lV@2F
Iterator::ModelR?r????!Ky׍??G@)?ܴ?!??1E?.\?C@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??????!m?0Vҟ7@)?h8en???1??yVQ3@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap????Kq??!?M?/X7@)???]/M??1?C???2@:Preprocessing2U
Iterator::Model::ParallelMapV20? ???{?!0XK??a@)0? ???{?10XK??a@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip^??N??!??(rpvJ@)?P3???u?1??Moz?@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSliceI???p?p?!?+?֏@)I???p?p?1?+?֏@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensort(CUL?o?!g?qr?9@)t(CUL?o?1g?qr?9@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 14.7% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).high"?70.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.*no9??ȿ?I??>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	????????????????!????????      ??!       "	S%??RN??S%??RN??!S%??RN??*      ??!       2	u???u???!u???:	Z?!?[=
@Z?!?[=
@!Z?!?[=
@B      ??!       J	_?;???_?;???!_?;???R      ??!       Z	_?;???_?;???!_?;???JGPUY??ȿ?I??b ?"m
:categorical_crossentropy/softmax_cross_entropy_with_logitsSoftmaxCrossEntropyWithLogits0%l j??!0%l j??""
ArgMaxArgMax?wT۹?!???u????"$
ArgMax_1ArgMax7???????!ؔC????"7
sequential/dense_1/SoftmaxSoftmax???٘???!???R???"5
sequential/dense_1/MatMulMatMul,?g?????!?7??G??"C
'gradient_tape/sequential/dense_1/MatMulMatMul?Q???f??!?(????".
IteratorGetNext/_13_Send?????!Uִ䬧??"K
$Adam/Adam/update_3/ResourceApplyAdamResourceApplyAdamLe? ?C??!)?e?9??"A
%gradient_tape/sequential/dense/MatMulMatMul=?????!g#N????"E
)gradient_tape/sequential/dense_1/MatMul_1MatMul?;??9??!V̄}?;??Q      Y@Y?????jI@aUUUUU?H@qT?P????ys?­/???"?

both?Your program is POTENTIALLY input-bound because 14.7% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"O
Mtensorflow_stats (identify the time-consuming operations executed on the GPU)"U
Strace_viewer (look at the activities on the timeline of each GPU in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2?
=type.googleapis.com/tensorflow.profiler.GenericRecommendation?
high?70.8 % of the total step time sampled is spent on 'Kernel Launch'. It could be due to CPU contention with tf.data. In this case, you may try to set the environment variable TF_GPU_THREAD_MODE=gpu_private.no*?Only 0.0% of device computation is 16 bit. So you might want to replace more 32-bit Ops by 16-bit Ops to improve performance (if the reduced accuracy is acceptable).:
Refer to the TF2 Profiler FAQ2"GPU(: B 