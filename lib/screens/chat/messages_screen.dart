import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/colors.dart';
import 'chat_area_screen.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<_ChatPreview> _allChats = const [
    _ChatPreview(
      name: 'Dr. Emily Stone',
      specialty: 'Cardiologist',
      lastMessage: 'Your test results are ready. Everything looks good.',
      timeLabel: '2m ago',
      avatar: 'assets/doc/doc4.jpeg',
      isOnline: true,
      unreadCount: 2,
    ),
    _ChatPreview(
      name: 'Dr. James Wilson',
      specialty: 'Neurologist',
      lastMessage: 'Please take the prescribed medication regularly.',
      timeLabel: '1h ago',
      avatar: 'assets/doc/doc2.jpeg',
      isOnline: true,
      unreadCount: 0,
    ),
    _ChatPreview(
      name: 'Dr. Maria Garcia',
      specialty: 'Pediatrician',
      lastMessage: 'Thank you for the update. See you next week.',
      timeLabel: '3h ago',
      avatar: 'assets/doc/doc3.jpeg',
      isOnline: false,
      unreadCount: 0,
    ),
    _ChatPreview(
      name: 'Dr. Robert Chen',
      specialty: 'Dentist',
      lastMessage: 'Your dental checkup is scheduled for next Monday.',
      timeLabel: 'Yesterday',
      avatar: 'assets/doc/doc2.jpeg',
      isOnline: false,
      unreadCount: 1,
    ),
    _ChatPreview(
      name: 'Dr. Lisa Anderson',
      specialty: 'Dermatologist',
      lastMessage: 'The treatment is showing good progress.',
      timeLabel: '2 days ago',
      avatar: 'assets/doc/doc9.jpeg',
      isOnline: false,
      unreadCount: 0,
    ),
  ];

  String _query = '';

  List<_ChatPreview> get _filteredChats {
    final q = _query.trim().toLowerCase();
    if (q.isEmpty) return _allChats;
    return _allChats
        .where((c) =>
            c.name.toLowerCase().contains(q) ||
            c.specialty.toLowerCase().contains(q) ||
            c.lastMessage.toLowerCase().contains(q))
        .toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Messages',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackTxt,
                    ),
                  ),
                  Container(
                    width: 32.r,
                    height: 32.r,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                      size: 18.r,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Container(
                height: 44.h,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12.r),
                  border:
                      Border.all(color: AppColors.black.withValues(alpha: 0.1)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.03),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search_rounded,
                        color: AppColors.hintTxtColor,
                        size: 18.r,
                      ),
                      SizedBox(width: 8.w),
                      Expanded(
                        child: TextFormField(
                          controller: _searchController,
                          onChanged: (v) {
                            setState(() => _query = v);
                          },
                          onTapOutside: (event) {
                            FocusScope.of(context).unfocus();
                          },
                          decoration: InputDecoration(
                            isDense: true,
                            hintText: 'Search messages...',
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              fontSize: 13.sp,
                              color: AppColors.hintTxtColor,
                            ),
                          ),
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: AppColors.blackTxt,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredChats.length,
                padding: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
                itemBuilder: (context, index) {
                  final chat = _filteredChats[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.h),
                    child: _ChatTile(chat: chat),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChatPreview {
  const _ChatPreview({
    required this.name,
    required this.specialty,
    required this.lastMessage,
    required this.timeLabel,
    required this.avatar,
    required this.isOnline,
    required this.unreadCount,
  });

  final String name;
  final String specialty;
  final String lastMessage;
  final String timeLabel;
  final String avatar;
  final bool isOnline;
  final int unreadCount;
}

class _ChatTile extends StatelessWidget {
  const _ChatTile({required this.chat});

  final _ChatPreview chat;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ChatAreaScreen(
              doctorName: chat.name,
              specialty: chat.specialty,
              avatarPath: chat.avatar,
            ),
          ),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10.r),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(18.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.03),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  width: 44.r,
                  height: 44.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    chat.avatar,
                    fit: BoxFit.cover,
                  ),
                ),
                if (chat.isOnline)
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: Container(
                      width: 10.r,
                      height: 10.r,
                      decoration: BoxDecoration(
                        color: const Color(0xff27AE60),
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.white, width: 2),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: AppColors.blackTxt,
                          ),
                        ),
                      ),
                      SizedBox(width: 6.w),
                      Text(
                        chat.timeLabel,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: AppColors.hintTxtColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.hintTxtColor,
                    ),
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.w,
                          vertical: 3.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE9FFF4),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          chat.specialty,
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xff27AE60),
                          ),
                        ),
                      ),
                      if (chat.unreadCount > 0) ...[
                        SizedBox(width: 8.w),
                        Container(
                          width: 18.r,
                          height: 18.r,
                          decoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            chat.unreadCount.toString(),
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

