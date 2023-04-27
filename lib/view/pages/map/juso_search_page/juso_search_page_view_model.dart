// 창고 관리자
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:village/model/place/place.dart';

final jusoSearchPageProvider = StateNotifierProvider.autoDispose<
    JusoSearchPageViewModel, JusoSearchPageModel?>((ref) {
  //placeId
  // SessionUser sessionUser = ref.read(sessionProvider);
  return JusoSearchPageViewModel(null, ref);
  // ..notifyInit(postId, sessionUser.jwt!);
});

// 창고 데이터
class JusoSearchPageModel {
  Address address;
  String? resevasionDate;
  JusoSearchPageModel({
    required this.address,
    this.resevasionDate,
  });
}

// 창고 - 관리
class JusoSearchPageViewModel extends StateNotifier<JusoSearchPageModel?> {
  JusoSearchPageViewModel(super.state, this.ref);
  Ref ref;

  // void notifyInit(int id, String jwt) async {
  //   ResponseDTO responseDTO = await PlaceRepository().fetchPost(id, jwt);
  //   state = JusoSearchPageModel(place: responseDTO.data, tabNum: );
  // }

  // void notifyRemove(int id){
  //   Place place = state!.place;
  //   if(place.id == id){
  //     state = null;
  //   }
  // }

  // api 수정 요청 -> 수정된 Post를 돌려받음.
  // void notifyUpdate(Place updatePost){
  //   state = JusoSearchPageModel(place: updatePost);
  // }

  // void changeScrolled(bool scrolled) {
  //   state = JusoSearchPageModel(isscrolled: scrolled);
  // }

  // void reservationDate(String input) {
  //   Logger().d('값 변경됨');
  //   state = JusoSearchPageModel(resevasionDate: input);
  // }

  void notifyAdd(Address address) {
    state = JusoSearchPageModel(address: address);
  }

  void inin() {
    // Logger().d('널 아님');
  }
}
