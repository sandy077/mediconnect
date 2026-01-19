import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mediconnect/utils/colors.dart';

class ChatAreaScreen extends StatelessWidget {
  const ChatAreaScreen({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.avatarPath,
  });

  final String doctorName;
  final String specialty;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    final List<_ChatMessage> messages = [
      _ChatMessage(
        isMe: false,
        time: '9:30 AM',
        text: 'Hello Sarah! How are you feeling today?',
      ),
      _ChatMessage(
        isMe: true,
        time: '9:32 AM',
        text: "Hi Doctor! I'm feeling much better now. The medication is working well.",
      ),
      _ChatMessage(
        isMe: false,
        time: '9:33 AM',
        text:
            "That's great to hear! Your test results came back and everything looks normal.",
      ),
      _ChatMessage(
        isMe: false,
        time: '9:34 AM',
        text: "Here's your test report:",
      ),
      _ChatMessage(
        isMe: false,
        time: '9:34 AM',
        isDocument: true,
        documentName: 'Blood_Test_Report.pdf',
        documentSize: '245 KB',
      ),
      _ChatMessage(
        isMe: true,
        time: '9:35 AM',
        text:
            "Thank you so much! That's a relief. Should I continue with the same medication?",
      ),
      _ChatMessage(
        isMe: false,
        time: '9:36 AM',
        text:
            "Yes, please continue for another week. Let's schedule a follow-up appointment next Monday.",
      ),
      _ChatMessage(
        isMe: true,
        time: '9:37 AM',
        text:
            'Perfect! I\'ll book the appointment. Thank you, Doctor! 😊',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF4F7FB),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(72.h),
        child: AppBar(
          elevation: 0,
          backgroundColor: AppColors.white,
          leadingWidth: 40.w,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            color: AppColors.blackTxt,
            onPressed: () => Navigator.of(context).pop(),
          ),
          titleSpacing: 0,
          title: Row(
            children: [
              Container(
                width: 40.r,
                height: 40.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.r),
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset(
                  avatarPath,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      doctorName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blackTxt,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        Container(
                          width: 7.r,
                          height: 7.r,
                          decoration: const BoxDecoration(
                            color: Color(0xff27AE60),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          'Online',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: const Color(0xff27AE60),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.call_rounded),
              color: AppColors.primaryColor,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voice call')),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.videocam_rounded),
              color: AppColors.primaryColor,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Video call')),
                );
              },
            ),
            SizedBox(width: 6.w),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              itemCount: messages.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 12.h),
                    child: Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffE9F3FF),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          'Today, 9:30 AM',
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: AppColors.hintTxtColor,
                          ),
                        ),
                      ),
                    ),
                  );
                }
                final msg = messages[index - 1];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.h),
                  child: _ChatBubble(
                    message: msg,
                    avatarPath: avatarPath,
                  ),
                );
              },
            ),
          ),
          const _MessageInputBar(),
        ],
      ),
    );
  }
}

class _ChatMessage {
  _ChatMessage({
    required this.isMe,
    required this.time,
    this.text,
    this.isDocument = false,
    this.documentName,
    this.documentSize,
  });

  final bool isMe;
  final String time;
  final String? text;
  final bool isDocument;
  final String? documentName;
  final String? documentSize;
}

class _ChatBubble extends StatelessWidget {
  const _ChatBubble({
    required this.message,
    required this.avatarPath,
  });

  final _ChatMessage message;
  final String avatarPath;

  @override
  Widget build(BuildContext context) {
    final bubbleColor = message.isMe
        ? AppColors.primaryColor
        : AppColors.white;
    final textColor = message.isMe ? AppColors.white : AppColors.blackTxt;

    Widget bubbleContent;
    if (message.isDocument) {
      bubbleContent = Row(
        children: [
          Container(
            width: 32.r,
            height: 32.r,
            decoration: BoxDecoration(
              color: const Color(0xffE9F3FF),
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Icon(
              Icons.insert_drive_file_rounded,
              color: const Color(0xff2D9CDB),
              size: 18.r,
            ),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message.documentName ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackTxt,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  message.documentSize ?? '',
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.hintTxtColor,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.download_rounded,
            size: 20.r,
            color: AppColors.primaryColor,
          ),
        ],
      );
    } else {
      bubbleContent = Text(
        message.text ?? '',
        style: TextStyle(
          fontSize: 13.sp,
          color: textColor,
        ),
      );
    }

    return Column(
      crossAxisAlignment:
          message.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment:
              message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!message.isMe)
              Padding(
                padding: EdgeInsets.only(right: 6.w),
                child: Container(
                  width: 28.r,
                  height: 28.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    avatarPath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: message.isDocument
                      ? AppColors.white
                      : bubbleColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomLeft: Radius.circular(message.isMe ? 16.r : 4.r),
                    bottomRight: Radius.circular(message.isMe ? 4.r : 16.r),
                  ),
                ),
                child: bubbleContent,
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Text(
          message.time,
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.hintTxtColor,
          ),
        ),
      ],
    );
  }
}

class _MessageInputBar extends StatelessWidget {
  const _MessageInputBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.w, 8.h, 16.w, 12.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(
            Icons.add_circle_outline_rounded,
            color: AppColors.primaryColor,
            size: 24.r,
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Container(
              padding:
                  EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
              decoration: BoxDecoration(
                color: const Color(0xffF4F7FB),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        hintText: 'Type your message...',
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
                  Icon(
                    Icons.emoji_emotions_outlined,
                    size: 20.r,
                    color: AppColors.hintTxtColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            width: 38.r,
            height: 38.r,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                Icons.send_rounded,
                size: 18.r,
                color: AppColors.white,
              ),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Message sent')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}