	0?????0?????!0?????	#P$??l@#P$??l@!#P$??l@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:0??????ص?ݒ??A??D?V??Y??z?<d??rEagerKernelExecute 0*	ˡE???Y@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??Hi6??!?>܇=@)??-@ۚ?1?l??h9@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenateߧ??@,??!??l?9@)4`?_???1E?*(3@:Preprocessing2U
Iterator::Model::ParallelMapV2iR
?????!0`??\?0@)iR
?????10`??\?0@:Preprocessing2F
Iterator::ModelY?yVҊ??!??ĸ?=@)?m?8)̋?1LW闷L*@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip'f?ʉ??!}???Q@)??;????1??E?&@:Preprocessing2?
OIterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::Concatenate[0]::TensorSlice?b*???{?!??!Eg5@)?b*???{?1??!Eg5@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?n?lq?!@3D?I|@)?n?lq?1@3D?I|@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap????O???!?ۘ??R=@)?ng_y?n?1???$??@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is POTENTIALLY input-bound because 3.7% of the total step time sampled is spent on 'All Others' time (which could be due to I/O or Python execution or both).no*no9#P$??l@I??9?$X@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	?ص?ݒ???ص?ݒ??!?ص?ݒ??      ??!       "      ??!       *      ??!       2	??D?V????D?V??!??D?V??:      ??!       B      ??!       J	??z?<d????z?<d??!??z?<d??R      ??!       Z	??z?<d????z?<d??!??z?<d??b      ??!       JCPU_ONLYY#P$??l@b q??9?$X@