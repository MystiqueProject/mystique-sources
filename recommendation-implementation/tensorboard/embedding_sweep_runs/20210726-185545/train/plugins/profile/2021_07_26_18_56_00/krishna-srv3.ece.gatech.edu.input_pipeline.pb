	?ᔹ????ᔹ???!?ᔹ???	:??-?@:??-?@!:??-?@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:?ᔹ?????*l???A?@8??YuXᖏ??rEagerKernelExecute 0*	&??C#U@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeatA?+????!欐_#;B@)&qVDM???1΍(?=@:Preprocessing2U
Iterator::Model::ParallelMapV2??/??L??!???2?"5@)??/??L??1???2?"5@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap7l[?? ??!xGI?6@)?A`??"??1??rK?W/@:Preprocessing2F
Iterator::Modelv??fG???!+?H_^IB@)??-????1?dZ??.@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensorn???Wuv?!?.N?z?@)n???Wuv?1?.N?z?@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice?-???=v?!_?6?J?@)?-???=v?1_?6?J?@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip?L!u??!?h????O@)????p?1?e??|@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 3.8% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no9:??-?@I???
X@Zno#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	??*l?????*l???!??*l???      ??!       "      ??!       *      ??!       2	?@8???@8??!?@8??:      ??!       B      ??!       J	uXᖏ??uXᖏ??!uXᖏ??R      ??!       Z	uXᖏ??uXᖏ??!uXᖏ??b      ??!       JCPU_ONLYY:??-?@b q???
X@