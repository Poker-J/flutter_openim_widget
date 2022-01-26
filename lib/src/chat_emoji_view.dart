import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_openim_widget/flutter_openim_widget.dart';
import 'package:flutter_openim_widget/src/util/az_behavior.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const emojiFaces = <String, String>{
  '[打脸]': 'azv',
  '[嘿哈]': 'azw',
  '[奸笑]': 'azx',
  '[捂脸哭]': 'azy',
  '[机智如我]': 'azz',
  '[微笑]': 'fuck1',
  '[撇嘴]': 'fuck2',
  '[色]': 'fuck3',
  '[发呆]': 'fuck4',
  '[得意]': 'fuck5',
  '[流泪]': 'fuck6',
  '[害羞]': 'fuck7',
  '[闭嘴]': 'fuck8',
  '[睡]': 'fuck9',
  '[大哭]': 'fuck10',
  '[尴尬]': 'fuck11',
  '[发怒]': 'fuck12',
  '[调皮]': 'fuck13',
  '[呲牙]': 'fuck14',
  '[惊讶]': 'fuck15',
  '[难过]': 'fuck16',
  '[酷]': 'fuck17',
  '[抓狂]': 'fuck19',
  '[吐]': 'fuck20',
  '[偷笑]': 'fuck21',
  '[愉快]': 'fuck22',
  '[白眼]': 'fuck23',
  '[傲慢]': 'fuck24',
  '[饥饿]': 'fuck25',
  '[困]': 'fuck26',
  '[惊恐]': 'fuck27',
  '[流汗]': 'fuck29',
  '[憨笑]': 'fuck30',
  '[悠闲]': 'fuck31',
  '[奋斗]': 'fuck32',
  '[咒骂]': 'fuck33',
  '[疑问]': 'fuck34',
  '[嘘]': 'fuck35',
  '[晕]': 'fuck36',
  '[疯了]': 'fuck37',
  '[衰]': 'fuck38',
  '[敲打]': 'fuck39',
  '[再见]': 'fuck40',
  '[擦汗]': 'fuck41',
  '[抠鼻]': 'fuck42',
  '[鼓掌]': 'fuck43',
  '[糗大了]': 'fuck44',
  '[坏笑]': 'fuck45',
  '[左哼哼]': 'fuck46',
  '[右哼哼]': 'fuck47',
  '[哈欠]': 'fuck48',
  '[鄙视]': 'fuck49',
  '[委屈]': 'fuck50',
  '[快哭了]': 'fuck51',
  '[阴险]': 'fuck52',
  '[亲亲]': 'fuck53',
  '[吓]': 'fuck54',
  '[可怜]': 'fuck55',
  '[强]': 'fuck80',
  '[弱]': 'fuck81',
  '[握手]': 'fuck82',
  '[胜利]': 'fuck83',
  '[抱拳]': 'fuck84',
  '[OK]': 'fuck90',
  '[月亮]': 'fuck76',
};

class ChatEmojiView extends StatelessWidget {
  const ChatEmojiView({
    Key? key,
    this.onAddEmoji,
    this.onDeleteEmoji,
  }) : super(key: key);
  final Function()? onDeleteEmoji;
  final Function(String emoji)? onAddEmoji;

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: Duration(milliseconds: 200),
      child: Container(
        height: 190.h,
        child: Stack(
          children: [
            _buildEmojiLayout(),
            Positioned(
              bottom: 20.h,
              right: 10.w,
              child: Material(
                child: Ink(
                  child: InkWell(
                    onTap: onDeleteEmoji,
                    child: Container(
                      width: 35.w,
                      height: 25.h,
                      // color: Colors.black45.withOpacity(0.4),
                      child: Center(
                        child: IconUtil.assetImage(
                          'ic_del_face',
                          width: 18.w,
                          height: 16.h,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmojiLayout() => Container(
        color: Colors.white,
        child: AzScrollConfiguration(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 10.h),
            itemCount: emojiFaces.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
              childAspectRatio: 1,
              mainAxisSpacing: 1.w,
              crossAxisSpacing: 10.w,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Material(
                child: Ink(
                  child: InkWell(
                    onTap: () =>
                        onAddEmoji?.call(emojiFaces.keys.elementAt(index)),
                    child: Center(
                      child: IconUtil.assetImagePng(
                        emojiFaces.values.elementAt(index),
                        width: 30.h,
                        height: 30.h,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
}
