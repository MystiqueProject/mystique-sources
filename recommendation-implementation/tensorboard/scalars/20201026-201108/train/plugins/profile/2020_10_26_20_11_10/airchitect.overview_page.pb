?	+j0S@+j0S@!+j0S@	???ȴ?????ȴ??!???ȴ??"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$+j0S@???N$???A??/?d@Y????[??*	)\????b@2F
Iterator::Model+hZbe4??!.'????G@),??ص???11_m?SC@:Preprocessing2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMapǻ#c????!.'???(?@)kծ	i??1 ??x?;@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat¢"N'ٚ?!??LB_r1@)ͰQ?o&??1?6`???,@:Preprocessing2U
Iterator::Model::ParallelMapV2?<??S???!?7>U!@)?<??S???1?7>U!@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::Zip7???ZD??!??WJ@)-???ay?1dC?K@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice/?r?]?t?!m?????
@)/?r?]?t?1m?????
@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??C???r?!???`zl@)??C???r?1???`zl@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 1.5% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no9???ȴ??#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	???N$??????N$???!???N$???      ??!       "      ??!       *      ??!       2	??/?d@??/?d@!??/?d@:      ??!       B      ??!       J	????[??????[??!????[??R      ??!       Z	????[??????[??!????[??JCPU_ONLYY???ȴ??b Y      Y@q?Cy???"?
device?Your program is NOT input-bound because only 1.5% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2I
=type.googleapis.com/tensorflow.profiler.GenericRecommendation
nono:
Refer to the TF2 Profiler FAQ2"CPU: B 