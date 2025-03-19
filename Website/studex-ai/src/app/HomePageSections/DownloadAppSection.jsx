import React from 'react'

const DownloadAppSection = () => {
  return (
    <section
      id='download'
      className='relative overflow-hidden bg-gradient-to-b from-white to-indigo-50 py-20 dark:from-neutral-900 dark:to-indigo-950'
    >
      <div className='absolute -top-40 right-0 h-96 w-96 rounded-full bg-indigo-300 opacity-20 blur-3xl dark:bg-indigo-600'></div>
      <div className='absolute -bottom-32 -left-20 h-96 w-96 rounded-full bg-purple-300 opacity-20 blur-3xl dark:bg-purple-600'></div>

      <div className='container relative z-10 mx-auto px-4'>
        <div className='mx-auto mb-16 max-w-3xl text-center'>
          <span className='inline-block rounded-full bg-indigo-100 px-3 py-1 text-sm font-semibold text-indigo-800 dark:bg-indigo-900/30 dark:text-indigo-300'>
            Get Started
          </span>
          <h2 className='animate__animated animate__fadeIn mt-4 text-3xl font-bold leading-tight text-gray-900 dark:text-white sm:text-4xl lg:text-5xl'>
            Download Our App Today
          </h2>
          <p className='mt-4 text-xl text-gray-600 dark:text-gray-300'>
            Begin your learning journey with just a few clicks
          </p>
        </div>

        <div className='mx-auto grid max-w-6xl gap-12 lg:grid-cols-2'>
          <div className='flex items-center justify-center'>
            <div className='relative max-w-sm'>
              <div className='animate__animated animate__fadeInUp relative z-20 mx-auto overflow-hidden rounded-[2.5rem] border-[14px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
                <div className='h-[500px] w-60 overflow-hidden'>
                  <div className='h-full w-full'>
                    <div className='h-full bg-gradient-to-b from-indigo-600 to-purple-600 p-4 text-white dark:from-indigo-700 dark:to-purple-700'>
                      <div className='mt-12 text-center'>
                        <div className='mx-auto flex h-20 w-20 items-center justify-center rounded-full bg-white/20 backdrop-blur-sm'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-10 w-10 text-white'
                            fill='none'
                            viewBox='0 0 24 24'
                            stroke='currentColor'
                            data-darkreader-inline-stroke=''
                            styles='--darkreader-inline-stroke: currentColor;'
                          >
                            <path
                              stroke-linecap='round'
                              stroke-linejoin='round'
                              stroke-width='2'
                              d='M12 6.253v13m0-13C10.832 5.477 9.246 5 7.5 5S4.168 5.477 3 6.253v13C4.168 18.477 5.754 18 7.5 18s3.332.477 4.5 1.253m0-13C13.168 5.477 14.754 5 16.5 5c1.747 0 3.332.477 4.5 1.253v13C19.832 18.477 18.247 18 16.5 18c-1.746 0-3.332.477-4.5 1.253'
                            ></path>
                          </svg>
                        </div>
                        <h3 className='mt-4 text-2xl font-bold'>EduLearn</h3>
                        <p className='mt-1 text-sm text-indigo-200'>
                          Learn. Connect. Excel.
                        </p>
                      </div>

                      <div className='mt-12 space-y-6 px-4'>
                        <div className='rounded-lg bg-white/10 p-4 backdrop-blur-sm'>
                          <h4 className='text-base font-medium'>
                            Mobile Number Login
                          </h4>
                          <div className='mt-2 rounded-md bg-white/10 px-3 py-2'>
                            <div className='text-sm'>+91 ••••• •••••</div>
                          </div>
                        </div>

                        <button className='w-full rounded-lg bg-white py-3 text-center font-medium text-indigo-600 shadow-lg'>
                          Get OTP
                        </button>

                        <div className='text-center text-sm text-indigo-200'>
                          <span>New to EduLearn?</span>
                          <span className='font-medium text-white'>
                            {' '}
                            Register Now
                          </span>
                        </div>
                      </div>

                      <div className='absolute bottom-6 left-0 right-0 text-center'>
                        <div className='text-xs text-indigo-200'>
                          Version 2.4.1
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className='animate__animated animate__fadeInLeft animate__delay-1s absolute -left-20 top-20 z-10 w-56 rotate-[-12deg] overflow-hidden rounded-[2.5rem] border-[14px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
                <div className='h-[400px] w-full overflow-hidden'>
                  <div className='h-full bg-gradient-to-b from-emerald-600 to-teal-600 p-4 text-white dark:from-emerald-700 dark:to-teal-700'>
                    <div className='flex items-center justify-between py-2'>
                      <div className='text-sm font-medium'>Home</div>
                      <div className='flex space-x-2'>
                        <div className='rounded-full bg-white/10 p-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-4 w-4'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path d='M10 2a6 6 0 00-6 6v3.586l-.707.707A1 1 0 004 14h12a1 1 0 00.707-1.707L16 11.586V8a6 6 0 00-6-6zM10 18a3 3 0 01-3-3h6a3 3 0 01-3 3z'></path>
                          </svg>
                        </div>
                        <div className='rounded-full bg-white/10 p-1'>
                          <svg
                            xmlns='http://www.w3.org/2000/svg'
                            className='h-4 w-4'
                            viewBox='0 0 20 20'
                            fill='currentColor'
                            data-darkreader-inline-fill=''
                            styles='--darkreader-inline-fill: currentColor;'
                          >
                            <path
                              fill-rule='evenodd'
                              d='M10 9a3 3 0 100-6 3 3 0 000 6zm-7 9a7 7 0 1114 0H3z'
                              clip-rule='evenodd'
                            ></path>
                          </svg>
                        </div>
                      </div>
                    </div>

                    <div className='mt-3'>
                      <h3 className='text-base font-semibold'>
                        Welcome, Alex!
                      </h3>
                      <p className='text-xs text-teal-100'>
                        Continue your learning journey
                      </p>
                    </div>

                    <div className='mt-4 rounded-lg bg-white/10 p-3 backdrop-blur-sm'>
                      <div className='text-sm font-medium'>Recent Subjects</div>
                      <div className='mt-2 space-y-2'>
                        <div className='flex items-center rounded-md bg-white/10 p-2'>
                          <div className='flex h-8 w-8 items-center justify-center rounded-full bg-indigo-100 text-indigo-600'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path d='M10 3.5a1.5 1.5 0 013 0V4a1 1 0 001 1h3a1 1 0 011 1v3a1 1 0 01-1 1h-.5a1.5 1.5 0 000 3h.5a1 1 0 011 1v3a1 1 0 01-1 1h-3a1 1 0 01-1-1v-.5a1.5 1.5 0 00-3 0v.5a1 1 0 01-1 1H6a1 1 0 01-1-1v-3a1 1 0 00-1-1h-.5a1.5 1.5 0 010-3H4a1 1 0 001-1V6a1 1 0 011-1h3a1 1 0 001-1v-.5z'></path>
                            </svg>
                          </div>
                          <div className='ml-3'>
                            <div className='text-xs font-medium'>
                              Mathematics
                            </div>
                            <div className='text-[10px] text-teal-200'>
                              3 chapters completed
                            </div>
                          </div>
                        </div>

                        <div className='flex items-center rounded-md bg-white/10 p-2'>
                          <div className='flex h-8 w-8 items-center justify-center rounded-full bg-green-100 text-green-600'>
                            <svg
                              xmlns='http://www.w3.org/2000/svg'
                              className='h-4 w-4'
                              viewBox='0 0 20 20'
                              fill='currentColor'
                              data-darkreader-inline-fill=''
                              styles='--darkreader-inline-fill: currentColor;'
                            >
                              <path
                                fill-rule='evenodd'
                                d='M4 2a2 2 0 00-2 2v11a3 3 0 106 0V4a2 2 0 00-2-2H4zm1 14a1 1 0 100-2 1 1 0 000 2zm5-1.757l4.9-4.9a2 2 0 000-2.828L13.485 5.1a2 2 0 00-2.828 0L10 5.757v8.486zM16 18H9.071l6-6H16a2 2 0 012 2v2a2 2 0 01-2 2z'
                                clip-rule='evenodd'
                              ></path>
                            </svg>
                          </div>
                          <div className='ml-3'>
                            <div className='text-xs font-medium'>Science</div>
                            <div className='text-[10px] text-teal-200'>
                              5 chapters completed
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div className='animate__animated animate__fadeInRight animate__delay-1s absolute -right-20 top-40 z-10 w-56 rotate-[12deg] overflow-hidden rounded-[2.5rem] border-[14px] border-gray-800 bg-white shadow-xl dark:border-gray-700 dark:bg-gray-800'>
                <div className='absolute left-1/2 top-0 h-5 w-24 -translate-x-1/2 -translate-y-1/2 rounded-b-lg rounded-t-2xl bg-gray-800 dark:bg-gray-700'></div>
                <div className='h-[400px] w-full overflow-hidden'>
                  <div className='h-full bg-gradient-to-b from-rose-600 to-pink-600 p-4 text-white dark:from-rose-700 dark:to-pink-700'>
                    <div className='flex items-center justify-between py-2'>
                      <div className='text-sm font-medium'>Quiz</div>
                      <div className='rounded-lg bg-white/10 px-2 py-1 text-xs'>
                        10:32 left
                      </div>
                    </div>

                    <div className='mt-3'>
                      <div className='flex items-center justify-between'>
                        <div className='text-xs'>Question 3 of 10</div>
                        <div className='text-xs'>Points: 20</div>
                      </div>
                      <div className='mt-1 h-1.5 w-full overflow-hidden rounded-full bg-white/20'>
                        <div className='h-full w-[30%] rounded-full bg-white'></div>
                      </div>
                    </div>

                    <div className='mt-4 rounded-lg bg-white/10 p-3 backdrop-blur-sm'>
                      <h3 className='text-sm font-medium'>
                        What is the formula for calculating acceleration?
                      </h3>

                      <div className='mt-4 space-y-2'>
                        <div className='rounded-md border border-white/20 p-2'>
                          <div className='text-xs'>A) a = v / t</div>
                        </div>
                        <div className='rounded-md border border-white/20 bg-white/10 p-2'>
                          <div className='text-xs font-medium'>
                            B) a = (v - u) / t
                          </div>
                        </div>
                        <div className='rounded-md border border-white/20 p-2'>
                          <div className='text-xs'>C) a = v × t</div>
                        </div>
                        <div className='rounded-md border border-white/20 p-2'>
                          <div className='text-xs'>D) a = v + u / t</div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div className='flex flex-col justify-center lg:pl-10'>
            <h3 className='text-2xl font-bold text-gray-900 dark:text-white md:text-3xl'>
              Transform Your Learning Experience
            </h3>
            <p className='mt-4 text-lg text-gray-600 dark:text-gray-300'>
              Download our app now and join thousands of students who are
              improving their grades and enjoying learning with EduLearn.
            </p>

            <div className='mt-8 space-y-4'>
              <div className='animate__animated animate__fadeInRight flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-10 w-10 items-center justify-center rounded-full bg-indigo-100 text-indigo-600 dark:bg-indigo-900/30 dark:text-indigo-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M10 2a4 4 0 00-4 4v1H5a1 1 0 00-.994.89l-1 9A1 1 0 004 18h12a1 1 0 00.994-1.11l-1-9A1 1 0 0015 7h-1V6a4 4 0 00-4-4zm2 5V6a2 2 0 10-4 0v1h4zm-6 3a1 1 0 112 0 1 1 0 01-2 0zm7-1a1 1 0 100 2 1 1 0 000-2z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                    Free to Download
                  </h4>
                  <p className='mt-1 text-gray-600 dark:text-gray-400'>
                    Our app is completely free to download on all major
                    platforms. Get started with our basic features at no cost.
                  </p>
                </div>
              </div>

              <div className='animate__animated animate__fadeInRight animate__delay-1s flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-10 w-10 items-center justify-center rounded-full bg-green-100 text-green-600 dark:bg-green-900/30 dark:text-green-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path
                        fill-rule='evenodd'
                        d='M6.267 3.455a3.066 3.066 0 001.745-.723 3.066 3.066 0 013.976 0 3.066 3.066 0 001.745.723 3.066 3.066 0 012.812 2.812c.051.643.304 1.254.723 1.745a3.066 3.066 0 010 3.976 3.066 3.066 0 00-.723 1.745 3.066 3.066 0 01-2.812 2.812 3.066 3.066 0 00-1.745.723 3.066 3.066 0 01-3.976 0 3.066 3.066 0 00-1.745-.723 3.066 3.066 0 01-2.812-2.812 3.066 3.066 0 00-.723-1.745 3.066 3.066 0 010-3.976 3.066 3.066 0 00.723-1.745 3.066 3.066 0 012.812-2.812zm7.44 5.252a1 1 0 00-1.414-1.414L9 10.586 7.707 9.293a1 1 0 00-1.414 1.414l2 2a1 1 0 001.414 0l4-4z'
                        clip-rule='evenodd'
                      ></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                    Regular Updates
                  </h4>
                  <p className='mt-1 text-gray-600 dark:text-gray-400'>
                    We continuously improve our app with new features, content,
                    and optimizations based on user feedback.
                  </p>
                </div>
              </div>

              <div className='animate__animated animate__fadeInRight animate__delay-2s flex items-start'>
                <div className='flex-shrink-0'>
                  <div className='flex h-10 w-10 items-center justify-center rounded-full bg-amber-100 text-amber-600 dark:bg-amber-900/30 dark:text-amber-400'>
                    <svg
                      xmlns='http://www.w3.org/2000/svg'
                      className='h-5 w-5'
                      viewBox='0 0 20 20'
                      fill='currentColor'
                      data-darkreader-inline-fill=''
                      styles='--darkreader-inline-fill: currentColor;'
                    >
                      <path d='M9 6a3 3 0 11-6 0 3 3 0 016 0zM17 6a3 3 0 11-6 0 3 3 0 016 0zM12.93 17c.046-.327.07-.66.07-1a6.97 6.97 0 00-1.5-4.33A5 5 0 0119 16v1h-6.07zM6 11a5 5 0 015 5v1H1v-1a5 5 0 015-5z'></path>
                    </svg>
                  </div>
                </div>
                <div className='ml-4'>
                  <h4 className='text-lg font-semibold text-gray-900 dark:text-white'>
                    Supportive Community
                  </h4>
                  <p className='mt-1 text-gray-600 dark:text-gray-400'>
                    Join a vibrant community of students and educators who help
                    each other succeed academically.
                  </p>
                </div>
              </div>
            </div>

            <div className='mt-10 flex flex-col space-y-4 sm:flex-row sm:space-x-4 sm:space-y-0'>
              <a
                href='#'
                className='animate__animated animate__pulse animate__infinite animate__slow flex items-center justify-center rounded-xl bg-black px-6 py-3 text-white transition-transform hover:-translate-y-1 hover:shadow-lg'
              >
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-6 w-6'
                  viewBox='0 0 512 512'
                >
                  <path
                    d='M99.617 8.057a50.191 50.191 0 00-38.815-6.713l230.932 230.933 74.846-74.846L99.617 8.057zm32.347-6.713a49.504 49.504 0 00-14.9 3.72L387.7 156.7l39.647-39.647-295.383-115.71zm116.175 402.693a50.006 50.006 0 0013.535 2.493c17.48 0 31.959-8.968 40.456-22.296L148.992 231.126 99.617 280.5l148.522 123.537zm30.45-339.531c-8.971-12.47-23.588-20.615-40.083-20.615a50.183 50.183 0 00-13.565 1.87l282.402 110.581-42.223 42.223-186.53-134.059z'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  ></path>
                </svg>
                <div className='ml-3 text-left'>
                  <div className='text-xs'>GET IT ON</div>
                  <div className='text-sm font-semibold'>Google Play</div>
                </div>
              </a>

              <a
                href='#'
                className='flex items-center justify-center rounded-xl bg-black px-6 py-3 text-white transition-transform hover:-translate-y-1 hover:shadow-lg'
              >
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-6 w-6'
                  viewBox='0 0 384 512'
                >
                  <path
                    d='M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z'
                    fill='currentColor'
                    data-darkreader-inline-fill=''
                    styles='--darkreader-inline-fill: currentColor;'
                  ></path>
                </svg>
                <div className='ml-3 text-left'>
                  <div className='text-xs'>Download on the</div>
                  <div className='text-sm font-semibold'>App Store</div>
                </div>
              </a>
            </div>

            <div className='mt-8 flex items-center'>
              <div className='flex text-yellow-400'>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path d='M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118l-2.8-2.034c-.783-.57-.38-1.81.588-1.81h3.462a1 1 0 00.95-.69l1.07-3.292z'></path>
                </svg>
              </div>
              <div className='ml-2 text-sm font-medium text-gray-700 dark:text-gray-300'>
                4.8/5 (10k+ reviews)
              </div>
            </div>

            <div className='mt-8 rounded-xl bg-white p-6 shadow-lg dark:bg-neutral-800'>
              <h4 className='font-semibold text-gray-900 dark:text-white'>
                System Requirements
              </h4>
              <div className='mt-4 grid gap-4 md:grid-cols-2'>
                <div>
                  <h5 className='text-sm font-medium text-gray-700 dark:text-gray-300'>
                    Android
                  </h5>
                  <ul className='mt-2 space-y-1 text-sm text-gray-600 dark:text-gray-400'>
                    <li>• Android 7.0 or higher</li>
                    <li>• 100MB free storage</li>
                    <li>• 2GB RAM recommended</li>
                  </ul>
                </div>
                <div>
                  <h5 className='text-sm font-medium text-gray-700 dark:text-gray-300'>
                    iOS
                  </h5>
                  <ul className='mt-2 space-y-1 text-sm text-gray-600 dark:text-gray-400'>
                    <li>• iOS 12.0 or higher</li>
                    <li>• 120MB free storage</li>
                    <li>• Compatible with iPhone, iPad</li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-6xl rounded-2xl bg-gradient-to-r from-indigo-600 to-purple-600 p-8 shadow-xl dark:from-indigo-700 dark:to-purple-700'>
          <div className='grid gap-8 text-center text-white sm:grid-cols-2 lg:grid-cols-4'>
            <div>
              <div className='text-4xl font-extrabold'>1M+</div>
              <div className='mt-2 text-indigo-100'>Downloads</div>
            </div>
            <div>
              <div className='text-4xl font-extrabold'>120+</div>
              <div className='mt-2 text-indigo-100'>Countries</div>
            </div>
            <div>
              <div className='text-4xl font-extrabold'>5K+</div>
              <div className='mt-2 text-indigo-100'>Schools</div>
            </div>
            <div>
              <div className='text-4xl font-extrabold'>50M+</div>
              <div className='mt-2 text-indigo-100'>Questions Answered</div>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-3xl'>
          <h3 className='mb-8 text-center text-2xl font-bold text-gray-900 dark:text-white'>
            Frequently Asked Questions
          </h3>

          <div className='space-y-4'>
            <div className='rounded-lg border border-gray-200 dark:border-gray-700'>
              <button className='flex w-full items-center justify-between px-4 py-3 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Is the app really free to download?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
              <div className='px-4 pb-4'>
                <p className='text-gray-600 dark:text-gray-400'>
                  Yes, the app is completely free to download and use with basic
                  features. We offer premium subscription plans for additional
                  features and content.
                </p>
              </div>
            </div>

            <div className='rounded-lg border border-gray-200 dark:border-gray-700'>
              <button className='flex w-full items-center justify-between px-4 py-3 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Can I use the app offline?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>

            <div className='rounded-lg border border-gray-200 dark:border-gray-700'>
              <button className='flex w-full items-center justify-between px-4 py-3 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  Is my data secure within the app?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>

            <div className='rounded-lg border border-gray-200 dark:border-gray-700'>
              <button className='flex w-full items-center justify-between px-4 py-3 text-left'>
                <span className='text-base font-medium text-gray-900 dark:text-white'>
                  How do I get help if I have problems with the app?
                </span>
                <svg
                  xmlns='http://www.w3.org/2000/svg'
                  className='h-5 w-5 text-indigo-600 dark:text-indigo-400'
                  viewBox='0 0 20 20'
                  fill='currentColor'
                  data-darkreader-inline-fill=''
                  styles='--darkreader-inline-fill: currentColor;'
                >
                  <path
                    fill-rule='evenodd'
                    d='M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z'
                    clip-rule='evenodd'
                  ></path>
                </svg>
              </button>
            </div>
          </div>
        </div>

        <div className='mx-auto mt-20 max-w-3xl rounded-2xl bg-white p-8 text-center shadow-xl dark:bg-neutral-800'>
          <h3 className='text-2xl font-bold text-gray-900 dark:text-white'>
            Ready to Transform Your Learning?
          </h3>
          <p className='mt-4 text-lg text-gray-600 dark:text-gray-300'>
            Join millions of students who are already using EduLearn to achieve
            academic excellence.
          </p>
          <div className='mt-8'>
            <a
              href='#'
              className='animate__animated animate__pulse animate__infinite animate__slow inline-flex items-center rounded-lg bg-gradient-to-r from-indigo-600 to-purple-600 px-6 py-3 text-base font-medium text-white shadow-lg transition-transform hover:-translate-y-1 hover:shadow-xl dark:from-indigo-700 dark:to-purple-700'
            >
              Download Now
              <svg
                xmlns='http://www.w3.org/2000/svg'
                className='ml-2 h-5 w-5'
                viewBox='0 0 20 20'
                fill='currentColor'
                data-darkreader-inline-fill=''
                styles='--darkreader-inline-fill: currentColor;'
              >
                <path
                  fill-rule='evenodd'
                  d='M16.707 10.293a1 1 0 010 1.414l-6 6a1 1 0 01-1.414 0l-6-6a1 1 0 111.414-1.414L9 14.586V3a1 1 0 012 0v11.586l4.293-4.293a1 1 0 011.414 0z'
                  clip-rule='evenodd'
                ></path>
              </svg>
            </a>
          </div>
        </div>
      </div>
    </section>
  )
}

export default DownloadAppSection
