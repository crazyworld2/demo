#VERSION: 1.0.1
FROM ubuntu
MAINTAINER xushuibo "1378183751@qq.com"
#����root�û�Ϊ���������ִ����
USER root
#ִ�в���
RUN apt-get update
RUN apt-get install -y nginx
#ʹ��&&ƴ������
RUN touch test.txt && echo "abc" >> abc.txt
#���Ⱪ¶�˿�
EXPOSE 80 8080 1038
#����ļ�
ADD mdir/abc.txt mdir/opt/
#����ļ���
ADD mdir/webapp mdir/opt/webapp
#��������ļ�
ADD https://www.baidu.com/img/bd_logo1.png opt/
#���û�������
ENV WEBAPP_PORT=9090
#���ù���Ŀ¼
WORKDIR mdir/
#������������
ENTRYPOINT ["ls"]
#������������
CMD ["-a","-l"]
#���þ�
VOLUME ["/data"]
#�����Ӿ���ĳ�������
ONBUILD ADD ./app/src 
ONBUILD RUN echo "on build excuted">>onbuild.txt
