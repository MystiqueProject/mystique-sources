	̘?5???̘?5???!̘?5???	??P??@??P??@!??P??@"{
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails:̘?5???T?:???Ad?1???Y????x???rEagerKernelExecute 0*	???x?fR@2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat??S???!]h???>@)ka?9͒?1?f:???8@:Preprocessing2U
Iterator::Model::ParallelMapV2?j{???!?)??m6@)?j{???1?)??m6@:Preprocessing2F
Iterator::Model??&????!???BD@)ȷw?ҋ?1?H7u2@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap>ϟ6?ӑ?!}*?o??7@)YİØ???1"???(?/@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSliceF?Swew?!??GD
@)F?Swew?1??GD
@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipvR_?vj??!??iB?M@)?6qr?Cq?1j????@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor?4a??o?!<?:Ѡ@)?4a??o?1<?:Ѡ@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
both?Your program is MODERATELY input-bound because 5.2% of the total step time sampled is waiting for input. Therefore, you would need to reduce both the input time and other time.no*moderate2s3.9 % of the total step time sampled is spent on 'All Others' time. This could be due to Python execution overhead.9??P??@I?6??вW@Zno>Look at Section 3 for the breakdown of input time on the host.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	T?:???T?:???!T?:???      ??!       "      ??!       *      ??!       2	d?1???d?1???!d?1???:      ??!       B      ??!       J	????x???????x???!????x???R      ??!       Z	????x???????x???!????x???b      ??!       JCPU_ONLYY??P??@b q?6??вW@