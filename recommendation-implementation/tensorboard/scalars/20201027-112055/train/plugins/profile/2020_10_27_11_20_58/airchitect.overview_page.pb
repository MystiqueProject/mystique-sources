?	0)>>!;@0)>>!;@!0)>>!;@	W???/???W???/???!W???/???"e
=type.googleapis.com/tensorflow.profiler.PerGenericStepDetails$0)>>!;@????
???A ???W?@Y7?X?O??*	?(\??1c@2f
/Iterator::Model::ParallelMapV2::Zip[0]::FlatMap??#*T7??!???L??=@)|*?=%???1???S?:@:Preprocessing2F
Iterator::Modelj??%!??!9??[???@)TpxADj??1z!?Al7@:Preprocessing2l
5Iterator::Model::ParallelMapV2::Zip[1]::ForeverRepeath+?m???!??M6@)?=?$@M??1}G?u??2@:Preprocessing2Z
#Iterator::Model::ParallelMapV2::ZipEH?ξ??!r??[Q@)?U?0?{??1?A4??40@:Preprocessing2U
Iterator::Model::ParallelMapV2X<?H?ۊ?!?G?!@)X<?H?ۊ?1?G?!@:Preprocessing2x
AIterator::Model::ParallelMapV2::Zip[1]::ForeverRepeat::FromTensor??.ow?!???e?S@)??.ow?1???e?S@:Preprocessing2v
?Iterator::Model::ParallelMapV2::Zip[0]::FlatMap[0]::TensorSlice???cw?r?!????É@)???cw?r?1????É@:Preprocessing:?
]Enqueuing data: you may want to combine small input data chunks into fewer but larger chunks.
?Data preprocessing: you may increase num_parallel_calls in <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#map" target="_blank">Dataset map()</a> or preprocess the data OFFLINE.
?Reading data from files in advance: you may tune parameters in the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch size</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave cycle_length</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer_size</a>)
?Reading data from files on demand: you should read data IN ADVANCE using the following tf.data API (<a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#prefetch" target="_blank">prefetch</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/Dataset#interleave" target="_blank">interleave</a>, <a href="https://www.tensorflow.org/api_docs/python/tf/data/TFRecordDataset#class_tfrecorddataset" target="_blank">reader buffer</a>)
?Other data reading or processing: you may consider using the <a href="https://www.tensorflow.org/programmers_guide/datasets" target="_blank">tf.data API</a> (if you are not using it now)?
:type.googleapis.com/tensorflow.profiler.BottleneckAnalysis?
device?Your program is NOT input-bound because only 1.1% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.no*no9W???/???#You may skip the rest of this page.B?
@type.googleapis.com/tensorflow.profiler.GenericStepTimeBreakdown?
	????
???????
???!????
???      ??!       "      ??!       *      ??!       2	 ???W?@ ???W?@! ???W?@:      ??!       B      ??!       J	7?X?O??7?X?O??!7?X?O??R      ??!       Z	7?X?O??7?X?O??!7?X?O??JCPU_ONLYYW???/???b Y      Y@q?V?????"?
device?Your program is NOT input-bound because only 1.1% of the total step time sampled is waiting for input. Therefore, you should focus on reducing other time.b
`input_pipeline_analyzer (especially Section 3 for the breakdown of input operations on the Host)m
ktrace_viewer (look at the activities on the timeline of each Host Thread near the bottom of the trace view)"T
Rtensorflow_stats (identify the time-consuming operations executed on the CPU_ONLY)"Z
Xtrace_viewer (look at the activities on the timeline of each CPU_ONLY in the trace view)*?
?<a href="https://www.tensorflow.org/guide/data_performance_analysis" target="_blank">Analyze tf.data performance with the TF Profiler</a>*y
w<a href="https://www.tensorflow.org/guide/data_performance" target="_blank">Better performance with the tf.data API</a>2I
=type.googleapis.com/tensorflow.profiler.GenericRecommendation
nono:
Refer to the TF2 Profiler FAQ2"CPU: B 