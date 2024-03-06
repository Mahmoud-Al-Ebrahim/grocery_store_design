import 'package:flutter_bloc/flutter_bloc.dart';
import '../Tag_cubit/tag_state.dart';

class TagCubit extends Cubit<TagChanged> {
  TagCubit() : super(TagChanged(""));

  void changeTag(String tag)=>emit(TagChanged(tag));
}
