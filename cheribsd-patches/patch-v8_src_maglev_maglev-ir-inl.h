--- v8/src/maglev/maglev-ir-inl.h.orig	2025-01-10 12:09:56.204220000 +0000
+++ v8/src/maglev/maglev-ir-inl.h	2025-01-10 12:10:52.112745000 +0000
@@ -30,11 +30,11 @@
 
 template <DeoptFrameVisitMode mode, typename T>
 using const_if_default =
-    std::conditional<mode == DeoptFrameVisitMode::kDefault, const T, T>::type;
+    std::conditional_t<mode == DeoptFrameVisitMode::kDefault, const T, T>;
 
 template <DeoptFrameVisitMode mode>
-using ValueNodeT = std::conditional<mode == DeoptFrameVisitMode::kDefault,
-                                    ValueNode*, ValueNode*&>::type;
+using ValueNodeT = std::conditional_t<mode == DeoptFrameVisitMode::kDefault,
+                                    ValueNode*, ValueNode*&>;
 
 template <DeoptFrameVisitMode mode, typename Function>
 void DeepForEachInputSingleFrameImpl(
