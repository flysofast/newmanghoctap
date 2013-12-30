using System;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MangHocTap
{
    public static class NotificationExtensions
    {
        public static void ShowNotification(this Control control, NotificationType notificationType, string message, TimeSpan timeBeforeHiding)
        {
            var totalNotificationShowingMilliseconds = timeBeforeHiding.TotalMilliseconds;
            var jNotifyDelay = totalNotificationShowingMilliseconds > 0
                                        ? totalNotificationShowingMilliseconds.ToString(CultureInfo.InvariantCulture)
                                        : "undefined"; // = ko add gì cả

            var notificationScript =
                string.Format(
                    "$( function () {{ if(typeof $.jnotify === 'function') {{ $.jnotify('{0}', '{1}', {2}); }} }} );",
                    HttpUtility.JavaScriptStringEncode(message), notificationType.ScriptKey, jNotifyDelay);

            // lấy unique key để có thể dùng nhiều notification 
            var scriptKey = Guid.NewGuid().ToString();

            // Gọi hàm ngay từ đầu để chạy ra đúng thứ tự lúc render ra page
            control.PreRender += new EventHandler
                ((sender, e) =>

                 ScriptManager.RegisterStartupScript(control, control.GetType(), scriptKey,
                                                         notificationScript,
                                                         addScriptTags: true));
        }

        public static void ShowNotification(this Control currentControl, NotificationType notificationType, string message)
        {
            ShowNotification(currentControl, notificationType, message, TimeSpan.FromMilliseconds(0));
        }

        public static void ShowSuccessfulNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.Success, notificationMessage);
        }

        public static void ShowWarningNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.Warning, notificationMessage);
        }

        public static void ShowErrorNotification(this Control currentControl, string notificationMessage)
        {
            ShowNotification(currentControl, NotificationType.Error, notificationMessage);
        }

        public static void ShowSuccessfulNotification(this Control currentControl, string notificationMessage, int milliseondsBeforeHiding)
        {
            ShowNotification(currentControl, NotificationType.Success, notificationMessage, TimeSpan.FromMilliseconds(milliseondsBeforeHiding));
        }

        public static void ShowWarningNotification(this Control currentControl, string notificationMessage, int milliseondsBeforeHiding)
        {
            ShowNotification(currentControl, NotificationType.Warning, notificationMessage, TimeSpan.FromMilliseconds(milliseondsBeforeHiding));
        }

        public static void ShowErrorNotification(this Control currentControl, string notificationMessage, int milliseondsBeforeHiding)
        {
            ShowNotification(currentControl, NotificationType.Error, notificationMessage, TimeSpan.FromMilliseconds(milliseondsBeforeHiding));
        }
    }
}